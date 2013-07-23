Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85DD16B216
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Jul 2013 02:04:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6N24OOd000271
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 22 Jul 2013 19:04:24 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 22 Jul 2013 19:04:24 -0700
Message-ID: <51EDE4A4.7060805@windriver.com>
Date: Tue, 23 Jul 2013 10:04:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1374226651.git.Qi.Chen@windriver.com>
	<9d5689b2a901728c1695d0889e27d2507c5c61a4.1374226651.git.Qi.Chen@windriver.com>
	<51EDC50D.3050503@linux.intel.com>
In-Reply-To: <51EDC50D.3050503@linux.intel.com>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] rpm: remove the obsolete rpm-postinsts.bb
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
X-List-Received-Date: Tue, 23 Jul 2013 02:04:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/23/2013 07:49 AM, Saul Wold wrote:
> On 07/19/2013 02:39 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Now that the postinsts of rpm, deb and ipk are all handled in the one
>> central place, run-postinsts.bb, the rpm-postinsts.bb recipe is actually
>> obsolete now. Remove this recipe to avoid confusion.
>>
> There still seems to be references to rpm-postinsts in the rootfs_rpm, 
> package_rpm and image.bb, while these seem unused, we should clean 
> these all up at the same time.
>
Hi Saul,

I checked these classes, no reference to the rpm-postinsts recipe.

And we can see that the ROOTFS_PKGMANAGE_BOOTSTRAP has been changed to 
'run-postinsts'.
meta/classes/rootfs_rpm.bbclass:ROOTFS_PKGMANAGE_BOOTSTRAP = "run-postinsts"

There are references to the /etc/rpm-postinsts directory which is 
actually handled by run-postinsts.bb recipe now.

Best Regards,
Chen Qi

>
> Sau!
>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-devtools/rpm/rpm-postinsts.bb |   54 
>> ----------------------------
>>   1 file changed, 54 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb
>>
>> diff --git a/meta/recipes-devtools/rpm/rpm-postinsts.bb 
>> b/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> deleted file mode 100644
>> index ba58cd4..0000000
>> --- a/meta/recipes-devtools/rpm/rpm-postinsts.bb
>> +++ /dev/null
>> @@ -1,54 +0,0 @@
>> -DESCRIPTION = "RPM postinstall script"
>> -SECTION = "core"
>> -LICENSE = "LGPLv2.1"
>> -LIC_FILES_CHKSUM = 
>> "file://${COREBASE}/meta/files/common-licenses/LGPL-2.1;md5=1a6d268fd218675ffea8be556788b780"
>> -
>> -inherit allarch
>> -#
>> -# Allow distributions to alter when [postponed] package install 
>> scripts are run
>> -#
>> -POSTINSTALL_INITPOSITION ?= "98"
>> -
>> -do_fetch() {
>> -    :
>> -}
>> -
>> -do_configure() {
>> -    :
>> -}
>> -
>> -do_compile() {
>> -    :
>> -}
>> -
>> -do_install() {
>> -    :
>> -}
>> -
>> -pkg_postinst_${PN} () {
>> -if [ "x$D" != "x" ] && [ -f $D/var/lib/rpm/Packages ]; then
>> -    install -d $D/${sysconfdir}/rcS.d
>> -    cat > 
>> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts << "EOF"
>> -#!/bin/sh
>> -[ -e ${sysconfdir}/default/postinst ] && . 
>> ${sysconfdir}/default/postinst
>> -[ -d ${sysconfdir}/rpm-postinsts ] && for i in `ls 
>> ${sysconfdir}/rpm-postinsts/`; do
>> -    i=${sysconfdir}/rpm-postinsts/$i
>> -    echo "Running postinst $i..."
>> -    if [ -x $i ]; then
>> -        if [ "$POSTINST_LOGGING" = "1" ]; then
>> -            $i >>$LOGFILE 2>&1
>> -        else
>> -            $i
>> -        fi
>> -        rm $i
>> -    else
>> -        echo "ERROR: postinst $i failed."
>> -    fi
>> -done
>> -rm -f ${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts 
>> 2>/dev/null
>> -EOF
>> -    chmod 0755 
>> $D${sysconfdir}/rcS.d/S${POSTINSTALL_INITPOSITION}run-postinsts
>> -fi
>> -}
>> -
>> -ALLOW_EMPTY_${PN} = "1"
>>
>
>


