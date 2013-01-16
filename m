Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TvIal-0002AX-OK
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 03:19:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0G23glH008752
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Jan 2013 18:03:42 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 15 Jan 2013 18:03:40 -0800
Message-ID: <50F60A66.60504@windriver.com>
Date: Wed, 16 Jan 2013 10:03:18 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1358216103-2735-1-git-send-email-Qi.Chen@windriver.com>
	<CAP9ODKq6X6o0yRLRUuSFsAPpfqc-9uA7AbtBMyi4qrZgvcFgsA@mail.gmail.com>
In-Reply-To: <CAP9ODKq6X6o0yRLRUuSFsAPpfqc-9uA7AbtBMyi4qrZgvcFgsA@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V7 6/6] volatile-conf-sato: add recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 16 Jan 2013 02:19:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/15/2013 07:26 PM, Otavio Salvador wrote:
> On Tue, Jan 15, 2013 at 12:15 AM,  <Qi.Chen@windriver.com> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> This recipe provides a config file for core-image-sato.
>> The config file is used to handle volatile storage in case of a
>> read-only-rootfs image.
>>
>> Also, let core-image-sato.bb depend on this recipe.
>>
>> [YOCTO #3406]
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   meta/recipes-sato/images/core-image-sato.bb        |    3 +++
>>   .../files/volatiles-readonly-sato                  |   14 ++++++++++++++
>>   .../volatile-conf-sato_1.0.bb                      |   15 +++++++++++++++
>>   3 files changed, 32 insertions(+)
>>   create mode 100644 meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
>>   create mode 100644 meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
> Please name the package and the dir the same. It will be confusing for
> user to try to guess where the .bb file is otherwise.

Hi Otavio,

As the conf file is related to the image recipe, so I keep the same 
directory hierarchy with the image recipes. Thus, instead of creating 
distinct directories for each conf recipe, I gather them together, in 
the way image recipes are organized.

poky/meta/recipes-core/images/
     -- image recipe 1
     -- image recipe 2

poky/meta/recipes-sato/images/
     -- image recipe 1
     -- image recipe 2

poky/meta/recipes-core/readonly-volatile-conf/
     -- conf recipe 1
     -- conf recipe 2

poky/meta/recipes-sato/readonly-volatile-conf/
     -- conf recipe 1
     -- conf recipe 2


Cheers,
Chen Qi

>> diff --git a/meta/recipes-sato/images/core-image-sato.bb b/meta/recipes-sato/images/core-image-sato.bb
>> index f52a1a5..a3d3d27 100644
>> --- a/meta/recipes-sato/images/core-image-sato.bb
>> +++ b/meta/recipes-sato/images/core-image-sato.bb
>> @@ -6,6 +6,9 @@ IMAGE_FEATURES += "splash package-management x11-base x11-sato ssh-server-dropbe
>>
>>   LICENSE = "MIT"
>>
>> +RDEPENDS += "volatile-conf-sato"
>> +
>>   inherit core-image
>>
>>   IMAGE_INSTALL += "packagegroup-core-x11-sato-games"
>> +IMAGE_INSTALL += "volatile-conf-sato"
>> diff --git a/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
>> new file mode 100644
>> index 0000000..4a56b81
>> --- /dev/null
>> +++ b/meta/recipes-sato/readonly-volatile-conf/files/volatiles-readonly-sato
>> @@ -0,0 +1,14 @@
>> +# This configuration file lists filesystem objects specific to sato image
>> +# with read-only rootfs.
>> +# This configuration file will only be applied if the image is sato and the
>> +# rootfs is read-only.
>> +# For the detailed format information, refer to /etc/default/volatiles/00_core.
>> +d root root 0755 /var/volatile/lib/ none
>> +d root root 0755 /var/volatile/lib/urandom/ none
>> +d root root 0755 /var/volatile/lib/dropbear/ none
>> +d root root 0755 /var/volatile/lib/nfs/ none
>> +d root root 0755 /var/volatile/lib/dbus/ none
>> +l root root 0755 /var/lib/urandom /var/volatile/lib/urandom
>> +l root root 0755 /var/lib/dropbear /var/volatile/lib/dropbear
>> +l root root 0755 /var/lib/nfs /var/volatile/lib/nfs
>> +l root root 0755 /var/lib/dbus /var/volatile/lib/dbus
>> diff --git a/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
>> new file mode 100644
>> index 0000000..acc8901
>> --- /dev/null
>> +++ b/meta/recipes-sato/readonly-volatile-conf/volatile-conf-sato_1.0.bb
>> @@ -0,0 +1,15 @@
>> +SUMMARY = "Provide config files for core-image-sato"
>> +DESCRIPTION = "This package contains a config file for core-image-sato. \
>> +It is used to handle volatile storage in case of a read-only rootfs."
>> +
>> +LICENSE = "MIT"
>> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +
>> +SRC_URI = "file://volatiles-readonly-sato"
>> +
>> +PR = "r1"
>> +
>> +do_install () {
>> +       install -d ${D}${sysconfdir}/default/volatiles
>> +       install -m 0644 ${WORKDIR}/volatiles-readonly-sato ${D}${sysconfdir}/default/volatiles/00_core_readonly
>> +}
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> --
> Otavio Salvador                             O.S. Systems
> E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
> Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br
>
>



