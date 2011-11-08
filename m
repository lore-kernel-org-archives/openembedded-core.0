Received: from mail.pbcl.net ([88.198.119.4] helo=hetzner.pbcl.net)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philb@gnu.org>) id 1RNkNl-0002QW-BR
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 13:02:25 +0100
Received: from elite.brightsigndigital.co.uk ([81.142.160.137]
	helo=[172.30.1.145])
	by hetzner.pbcl.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <philb@gnu.org>) id 1RNkHl-0007JC-5J
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 12:56:13 +0100
From: Phil Blundell <philb@gnu.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Tue, 08 Nov 2011 11:56:12 +0000
In-Reply-To: <7fe88fd604911f096a522deafaaeda3a93f5f966.1320750179.git.xiaofeng.yan@windriver.com>
References: <cover.1320750179.git.xiaofeng.yan@windriver.com>
	<7fe88fd604911f096a522deafaaeda3a93f5f966.1320750179.git.xiaofeng.yan@windriver.com>
X-Mailer: Evolution 3.0.2- 
Message-ID: <1320753373.22985.702.camel@phil-desktop>
Mime-Version: 1.0
Subject: Re: [PATCH 7/7] pango: Fix bug 1674
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 08 Nov 2011 12:02:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 19:16 +0800, Xiaofeng Yan wrote:
> -		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)}"
> +		${@base_contains('DISTRO_FEATURES', 'x11', '--with-x', '--without-x', d)} \
> +                ${@base_contains('DISTRO_FEATURES', 'directfb', '--with-x=no', '--with-x=yes', d)}"

That last line looks fairly wrong.  If I am understanding this right
then someone with neither x11 nor directfb set would get "--without-x
--with-x=yes", and someone with directfb but not X would get
"--without-x --with-x=no" which surely can't be what's wanted.  Did you
test this patchset?

>+    [ ! -d "/etc/pango" ] && mkdir -p /etc/pango/

Why can't you just ship this folder in the package rather than creating
it in the postinst?  Also, this should probably be ${sysconfdir} rather
than hardcoded.

p.




