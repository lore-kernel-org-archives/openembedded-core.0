Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rxr07-0000bf-GG for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 03:23:15 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gchoc-openembedded-core@m.gmane.org>)
	id 1Rxqdf-0000Fn-AS for openembedded-core@lists.openembedded.org;
	Thu, 16 Feb 2012 03:00:03 +0100
Received: from dsl-217-155-248-78.zen.co.uk ([217.155.248.78])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 03:00:03 +0100
Received: from kelvinl by dsl-217-155-248-78.zen.co.uk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2012 03:00:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-core@lists.openembedded.org
From: Kelvin Lawson <kelvinl@users.sf.net>
Date: Thu, 16 Feb 2012 01:53:08 +0000
Message-ID: <jhhni5$rcg$1@dough.gmane.org>
References: <1325911915-16001-5-git-send-email-steve@sakoman.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: dsl-217-155-248-78.zen.co.uk
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.26) Gecko/20120131 Thunderbird/3.1.18
In-Reply-To: <1325911915-16001-5-git-send-email-steve@sakoman.com>
Subject: Re: [PATCH] update-modules: don't run modutils.sh if systemd is installed
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
X-List-Received-Date: Thu, 16 Feb 2012 02:23:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

> +# Don't run modutils.sh if systemd is installed
> +if [ $first_time -eq 1 ]&&  [ ! -e /bin/systemctl ]; then
>     /etc/init.d/modutils.sh || true
>   fi

I just came across this and was wondering what the situation is with 
respect to systemd's module loading. Is there actually a mechanism in 
place for populating systemd's /etc/modules-load.d folder?

The "module_autoload_xx" directives populate /etc/modutils but not 
/etc/modules-load.d. As far as I can tell this means that one still 
needs to include the old modutils.sh script to autoload modules (via 
modutils-initscripts package). With this patch, you need to boot the 
system twice in order for the kernel modules to be auto-loaded (because 
update-modules does not reload modutils.sh immediately after adding the 
modules).

Are we in a transition period where module-autoload is not yet 
implemented via the systemd method but update-modules doesn't quite play 
ball properly with that, or is there already a mechanism for populating 
modules-load.d that I haven't found yet? (Other than doing it by hand).

Thanks,
Kelvin.



