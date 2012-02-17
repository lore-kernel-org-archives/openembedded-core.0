Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RyUVD-0001uF-99
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Feb 2012 21:33:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1HKPgq3022798
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 17 Feb 2012 12:25:42 -0800 (PST)
Received: from Macintosh-5.local (147.11.117.59) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 17 Feb 2012 12:25:42 -0800
Message-ID: <4F3EB7C5.6020605@windriver.com>
Date: Fri, 17 Feb 2012 12:25:41 -0800
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
In-Reply-To: <E7A9054A5ACABE48B0E540E46E862B0F04264D83@NAEMMAIL01.na.leapfrog.com>
Cc: Daniel Lazzari <dlazzari@leapfrog.com>
Subject: Re: Problems with Pseudo
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
X-List-Received-Date: Fri, 17 Feb 2012 20:33:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

The usual cause of this error is either a system level protection, i.e. 
grsecurity, app armor, or selinux policy that prevents preload libraries from 
being loaded.

The other option is something is set "setuid" and that also prevents LD_PRELOAD 
libraries from loading for security reasons.

Finally, you can get this message if you are on a mixed-mode (multilib) host. 
I.e. you have executables that are both ELF 32 and ELF64.  If so, you need to 
configure the system to build pseudo with both target environments, otherwise 
only one version is generated and you'll get an error when the "other" type is 
being executed.

--Mark

On 2/17/12 11:50 AM, Daniel Lazzari wrote:
> A problem just popped up today that I can't seem to fix. When trying to bitbake anything, I first get the following message:
>
> ERROR: ld.so: object 'libpseudo.so' from LD_PRELOAD cannot be preloaded: ignored.
>
> Followed by a bunch of debug output, detailing the configuration files being loaded, then finally I get:
>
> ERROR:  Poky's config sanity checker detected a potential misconfiguration.
>      Either fix the cause of this error or at your own risk disable the checker (see sanity.conf).
>      Following is the list of potential problems / advisories:
>
>      Pseudo is not functioning correctly, which will cause failures during package installation. Please check your configuration.
>
> ERROR: Execution of event handler 'check_sanity_eventhandler' failed
>
> I've never seen this before, but I'm afraid to disable it because I know how important pseudo is. Strangely enough, if I run pseudo (the one built in the i686-linux sysroot) manually from the command line, it works just fine. I tried blowing away my build directory and downloads but nothing seems to work. Has anyone seen this before or might be able to help me track down what's going on?
>
> Thanks,
>
> Dan Lazzari Jr.
> Firmware Engineer
> dlazzari@leapfrog.com
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



