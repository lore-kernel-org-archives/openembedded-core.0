Return-Path: <Ming.Liu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42D6E6CF1E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Oct 2013 09:51:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9H9paM7009224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Oct 2013 02:51:36 -0700 (PDT)
Received: from [128.224.162.145] (128.224.162.145) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Thu, 17 Oct 2013 02:51:36 -0700
Message-ID: <525FB325.1060503@windriver.com>
Date: Thu, 17 Oct 2013 17:51:33 +0800
From: Ming Liu <ming.liu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130330 Thunderbird/17.0.5
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <1381975446-25671-1-git-send-email-ming.liu@windriver.com>
	<20131017094054.GA3930@jama>
In-Reply-To: <20131017094054.GA3930@jama>
X-Originating-IP: [128.224.162.145]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V1 1/2] base-files: move shells generating process to pkg_postinst
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
X-List-Received-Date: Thu, 17 Oct 2013 09:51:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/17/2013 05:40 PM, Martin Jansa wrote:
> On Thu, Oct 17, 2013 at 10:04:05AM +0800, Ming Liu wrote:
>> The "shells" file lists several valid login shells, of which some might be
>> not present in a particular rootfs, this is unreasonable.
>>
>> Fix it by moving "shells" file generating process to pkg_postinst, for other
>> shells must do the same thing to register themselves to this file.
>>
>> Signed-off-by: Ming Liu <ming.liu@windriver.com>
>> ---
>>   meta/recipes-core/base-files/base-files/shells    | 8 --------
>>   meta/recipes-core/base-files/base-files_3.0.14.bb | 8 ++++++--
>>   2 files changed, 6 insertions(+), 10 deletions(-)
>>   delete mode 100644 meta/recipes-core/base-files/base-files/shells
>>
>> diff --git a/meta/recipes-core/base-files/base-files/shells b/meta/recipes-core/base-files/base-files/shells
>> deleted file mode 100644
>> index ce39b3d..0000000
>> --- a/meta/recipes-core/base-files/base-files/shells
>> +++ /dev/null
>> @@ -1,8 +0,0 @@
>> -# /etc/shells: valid login shells
>> -/bin/sh
>> -/bin/ash
>> -/bin/bash
>> -/bin/dash
>> -/bin/ksh
>> -/usr/bin/ksh
>> -/usr/bin/screen
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index 054fefa..47c7ebe 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -16,7 +16,6 @@ SRC_URI = "file://rotation \
>>              file://inputrc \
>>              file://host.conf \
>>              file://profile \
>> -           file://shells \
>>              file://fstab \
>>              file://filesystems \
>>              file://issue.net \
>> @@ -92,7 +91,6 @@ do_install () {
>>   	install -m 0644 ${WORKDIR}/usbd ${D}${sysconfdir}/default/usbd
>>   	sed -i "s#ROOTHOME#${ROOT_HOME}#" ${WORKDIR}/profile
>>   	install -m 0644 ${WORKDIR}/profile ${D}${sysconfdir}/profile
>> -	install -m 0644 ${WORKDIR}/shells ${D}${sysconfdir}/shells
>>   	install -m 0755 ${WORKDIR}/share/dot.profile ${D}${sysconfdir}/skel/.profile
>>   	install -m 0755 ${WORKDIR}/share/dot.bashrc ${D}${sysconfdir}/skel/.bashrc
>>   	install -m 0644 ${WORKDIR}/inputrc ${D}${sysconfdir}/inputrc
>> @@ -137,6 +135,12 @@ do_install_append_linuxstdbase() {
>>           done
>>   }
>>   
>> +pkg_postinst_${PN} () {
>> +        touch $D${sysconfdir}/shells
>> +        grep -q "bin/sh" $D${sysconfdir}/shells || echo /bin/sh >> $D${sysconfdir}/shells
> What it someone installs component providing /usr/bin/shell? Use at
> least ^/bin/sh$ in grep.
OK, better to be precise. I will send V2.

the best,
thank you

>
>> +}
>> +
>> +
>>   PACKAGES = "${PN}-doc ${PN} ${PN}-dev ${PN}-dbg"
>>   FILES_${PN} = "/"
>>   FILES_${PN}-doc = "${docdir} ${datadir}/common-licenses"
>> -- 
>> 1.8.3.3
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


