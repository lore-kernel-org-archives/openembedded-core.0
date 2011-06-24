Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1QaC0s-0000n4-St
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Jun 2011 21:25:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p5OJMLmY013510
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2011 12:22:21 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 24 Jun 2011 12:22:20 -0700
Message-ID: <4E04E3EC.1030604@windriver.com>
Date: Fri, 24 Jun 2011 14:22:20 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.2.17) Gecko/20110414 Thunderbird/3.1.10
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1308942534.git.mark.hatle@windriver.com>	<149d6209aca5fcc3eb708b81e9d0f28bf3706763.1308942534.git.mark.hatle@windriver.com>
	<BC8EDE88-C1B5-4991-BE9F-A5D735F81A3B@dominion.thruhere.net>
In-Reply-To: <BC8EDE88-C1B5-4991-BE9F-A5D735F81A3B@dominion.thruhere.net>
Subject: Re: [PATCH 1/1] prelink: Uprev prelink to latest version
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
X-List-Received-Date: Fri, 24 Jun 2011 19:25:59 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

On 6/24/11 2:18 PM, Koen Kooi wrote:
> 
> Op 24 jun 2011, om 21:10 heeft Mark Hatle het volgende geschreven:
> 
>> The latest cross-prelink version tracks the prelink r190 SVN.
>>
>> Fix two minor issues as well.  If we remove the package, we would
>> unprelink the filesystem after the rm was finished.  This is
>> incorrect.. we need to do this prerm.
>>
>> Also disable the cron configuration file.  This isn't appropriate
>> for embedded systems, but someone might still find it useful.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>> meta/recipes-devtools/prelink/prelink_git.bb |   18 +++++++++++++-----
>> 1 files changed, 13 insertions(+), 5 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
>> index 1eea30a..044cb6b 100644
>> --- a/meta/recipes-devtools/prelink/prelink_git.bb
>> +++ b/meta/recipes-devtools/prelink/prelink_git.bb
>> @@ -8,9 +8,9 @@ and executables, so that far fewer relocations need to be resolved at \
>> runtime and thus programs come up faster."
>> LICENSE = "GPLv2"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=c93c0550bd3173f4504b2cbd8991e50b"
>> -SRCREV = "909470ee441237563d6236c505cb2d02ddc48704"
>> +SRCREV = "ac461e73b17253a4da25c5aafeac7193b553156c"
>> PV = "1.0+git${SRCPV}"
>> -PR = "r2"
>> +PR = "r3"
>>
>> SRC_URI = "git://git.yoctoproject.org/prelink-cross.git;protocol=git \
>>            file://prelink.conf \
>> @@ -35,11 +35,15 @@ do_configure_prepend () {
>>         echo "all:" > ${S}/doc/Makefile.am
>> }
>>
>> +# Disabled the cron and cron configuration file, isn't appropriate for
>> +# embedded systems.  (The script re-prelinks the system daily -- on
>> +# systems where users are adding applications, this might be reasonable
>> +# but for embedded, we should be re-running prelink -a after an update.)
>> do_install_append () {
>> 	install -d ${D}${sysconfdir}/cron.daily ${D}${sysconfdir}/default ${D}${sysconfdir}/rpm
>> 	install -m 0644 ${WORKDIR}/prelink.conf ${D}${sysconfdir}/prelink.conf
>> -	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
>> -	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
>> +#	install -m 0644 ${WORKDIR}/prelink.cron.daily ${D}${sysconfdir}/cron.daily/prelink
>> +#	install -m 0644 ${WORKDIR}/prelink.default ${D}${sysconfdir}/default/prelink
>> 	install -m 0644 ${WORKDIR}/macros.prelink ${D}${sysconfdir}/rpm/macros.prelink
> 
> How about PACKAGES += prelink-cron, FILES_prelink-cron = "{sysconfdir}/cron.dailly" ,etc ,etc ?

I thought about that, but I'm still not sure the stuff is useful.. The default
configuration actually disables prelink and on the next run of cron will
un-prelink your system.

So it's really not useful from what I can tell.  Of course we could easily
change the default to "on" instead of off...  or change the prelink.bbclass to
enable the cron prelink script if it exists....  but as it stands it looks more
broken then useful.

--Mark


