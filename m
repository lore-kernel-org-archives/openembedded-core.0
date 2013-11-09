Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 722A26D2FB
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Nov 2013 22:01:53 +0000 (UTC)
Received: from blundell.swaffham-prior.co.uk ([91.216.112.25]
	helo=[192.168.114.7]) by hetzner.pbcl.net with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <pb@pbcl.net>)
	id 1VfGas-0004ta-Bk; Sat, 09 Nov 2013 23:01:53 +0100
Message-ID: <1384038034.3798.46.camel@x121e.pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: Qi.Chen@windriver.com
Date: Sat, 09 Nov 2013 23:00:34 +0000
In-Reply-To: <74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<74d67107ced2e10a00bc2ff9b84d42a7376fabae.1383974819.git.Qi.Chen@windriver.com>
Organization: Phil Blundell Consulting Ltd
X-Mailer: Evolution 3.4.4-3 
Mime-Version: 1.0
X-Spam_score: -1.0
X-Spam_score_int: -9
X-Spam_bar: -
X-Spam_report: Spam detection software,
	running on the system "hetzner.pbcl.net", has
	identified this incoming email as possible spam. The original message
	has been attached to this so you can view it (if it isn't spam) or
	label similar future email.  If you have any questions, see
	@@CONTACT_ADDRESS@@ for details.
	Content preview:  On Sat, 2013-11-09 at 13:28 +0800,
	Qi.Chen@windriver.com wrote:
	> +for dir in /usr/bin /usr/sbin; do > + if [ ! -e $dir ]; then > + if [
	"$VERBOSE" != "no" ];
	then > + echo "WARN: $dir missing, setting up links
	to busybox" > + fi > + mkdir -p $dir > + for suffix in ".nosuid"
	".suid" ""; 
	do > + if [ ! -e /etc/busybox.links${suffix} ]; then > + continue > + fi
	> + usr_commands=`grep "$dir" /etc/busybox.links${suffix}` > + for
	command in $usr_commands;
	do > + ln -sf /bin/busybox${suffix} $command > + done [...]
	Content analysis details:   (-1.0 points, 5.0 required)
	pts rule name              description
	---- ----------------------
	--------------------------------------------------
	-1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/8] initscripts: add setup-commands.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 09 Nov 2013 22:01:54 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-09 at 13:28 +0800, Qi.Chen@windriver.com wrote:
> +for dir in /usr/bin /usr/sbin; do
> +    if [ ! -e $dir ]; then
> +	if [ "$VERBOSE" != "no" ]; then
> +	    echo "WARN: $dir missing, setting up links to busybox"
> +	fi
> +	mkdir -p $dir
> +	for suffix in ".nosuid" ".suid" ""; do
> +	    if [ ! -e /etc/busybox.links${suffix} ]; then
> +		continue
> +	    fi
> +	    usr_commands=`grep "$dir" /etc/busybox.links${suffix}`
> +	    for command in $usr_commands; do
> +		ln -sf /bin/busybox${suffix} $command
> +	    done

This seems slightly bogus for a number of reasons:

1. initscript doesn't obviously rdepend on busybox so it's not obvious
that the latter will always be available;

2. it should probably be using ${base_bindir} and ${bindir} rather than
hardcoding absolute paths.

3. the whole idea of creating a shadow "/usr/bin" underneath what's
meant to be a mountpoint seems rather dubious to me. 

4. this seems like distro policy and not something that really belongs
in oe-core at all.  For systems where ${bindir} and ${base_bindir} are
on the same filesystem (or even are the same directory) this script will
just make bootup slower without achieving anything useful.

p.



