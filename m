Return-Path: <Lu.Jiang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2EDC86C4F2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 09:30:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2K9U24N025766
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 20 Mar 2019 02:30:03 -0700 (PDT)
Received: from [128.224.162.158] (128.224.162.158) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 20 Mar 2019 02:29:59 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20190319075451.18823-1-lu.jiang@windriver.com>
	<20190319075451.18823-3-lu.jiang@windriver.com>
	<613c27767a004365b122b1352321d88e@XBOX04.axis.com>
From: Jiang <Lu.Jiang@windriver.com>
Message-ID: <ea94ad94-8789-f718-a789-d366f570a2a4@windriver.com>
Date: Wed, 20 Mar 2019 17:27:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.1
MIME-Version: 1.0
In-Reply-To: <613c27767a004365b122b1352321d88e@XBOX04.axis.com>
Subject: Re: [oe-core 2/2] glib-networking:enable glib-networking complie as native package
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
X-List-Received-Date: Wed, 20 Mar 2019 09:30:11 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


在 2019/3/19 下午11:36, Peter Kjellerstedt 写道:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org <openembedded-
>> core-bounces@lists.openembedded.org> On Behalf Of Jiang Lu
>> Sent: den 19 mars 2019 08:55
>> To: lu.jiang@windriver.com; openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [oe-core 2/2] glib-networking:enable glib-networking
>> complie as native package
>>
>> Enable glib-networking compile as a native package, for it is depended
>> by
>> libsoup.
>>
>> Signed-off-by: Jiang Lu <lu.jiang@windriver.com>
>> ---
>>   .../glib-networking/glib-networking_2.58.0.bb | 31 +++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/meta/recipes-core/glib-networking/glib-
>> networking_2.58.0.bb b/meta/recipes-core/glib-networking/glib-
>> networking_2.58.0.bb
>> index f3190e1cae..35b4a3fa76 100644
>> --- a/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
>> +++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
>> @@ -29,3 +29,34 @@ FILES_${PN} += "\
>>                   "
>>   FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
>>   FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
>> +
>> +# Make sure we compile with ca-certificates support enabled.
>> +PACKAGECONFIG_append = " ca-certificates"
>> +
>> +DEPENDS += "ca-certificates"
>> +RDEPENDS_${PN} += "ca-certificates"
>> +
>> +# We need native version for ostree-/flatpak-native.
>> +BBCLASSEXTEND = "native"
>> +# OE-core's relocatable.bbclass assumes that every package which
>> +# ends up creating a ${libdir}/pkgconfig directory in its sysroot
>> +# will always also install .pc-files there and tries to uncondi-
>> +# tionally update paths in those files using globbing that fails
>> +# if no such files are present. This presumption is not true for
>> +# glib-networking which happens to create a directory by dereferencing
>> +# a GIO pkgconfig variable which in turn is defined relative to
>> +# the pkgconfig directory (${pcfiledir}/../...), causing pkgconfig
>> +# to get created.
> How about fixing relocatable_native_pcfiles() in relocatable.bbclass
> instead so that it ignores empty pkgconfig directories?


Thanks,

I prefer add a .pc file existence checking in relocatable_native_pcfiles()

-       if [ -d ${SYSROOT_DESTDIR}${libdir}/pkgconfig ]; then
+       filecnt=`ls -l ${SYSROOT_DESTDIR}${libdir}/pkgconfig/*.pc 
2>/dev/null | wc -l`
+       if [ $filecnt -gt 0 ]; then

Thanks

Jiang Lu

>
>> +#
>> +# Could be worked around in the upatream recipe but since that
>> +# does not provide/create native versions of the package and since
>> +# this problem is related to native packages, we work around it here.
>> +#
>> +do_install_append_class-native () {
>> +    for _pc in ${D}${libdir}/pkgconfig/*.pc; do
>> +        case $_pc in
>> +            *'*.pc') rm -fr ${D}${libdir}/pkgconfig;;
>> +            *.pc)    break;;
>> +        esac
>> +    done
> Why complicate things? Just remove the directory if it exists
> and is empty:
>
> 	rmdir ${D}${libdir}/pkgconfig 2>/dev/null || :
>
>> +}
>> --
>> 2.17.1
> //Peter
>
>

