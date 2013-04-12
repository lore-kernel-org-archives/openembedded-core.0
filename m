Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UQaNA-0005X0-Ju
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Apr 2013 11:34:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3C9GsTN001941
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Apr 2013 02:16:55 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 12 Apr 2013 02:16:55 -0700
Message-ID: <5167D179.5040602@windriver.com>
Date: Fri, 12 Apr 2013 17:18:49 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1362035905.git.kai.kang@windriver.com>
	<c100eba8e21c76e85e5250020c0b1d68c96e02d9.1362035905.git.kai.kang@windriver.com>
	<512F6B04.8010102@windriver.com> <513EC3CE.9070206@windriver.com>
	<513F49FE.5030909@windriver.com>
In-Reply-To: <513F49FE.5030909@windriver.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	r3C9GsTN001941
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] rpm: fix rpm2cpio segmentation fault
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
X-List-Received-Date: Fri, 12 Apr 2013 09:34:24 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B403=E6=9C=8812=E6=97=A5 23:30, Mark Hatle wrote:
> On 3/12/13 12:57 AM, Kang Kai wrote:
>> On 2013=E5=B9=B402=E6=9C=8828=E6=97=A5 22:34, Mark Hatle wrote:
>>> On 2/28/13 1:34 AM, Kang Kai wrote:
>>>> When run rpm2cpio, it fails with segmentation fault. The root cause =
is
>>>> no macro "_db_path" defined, when query its value get nothing then
>>>> cause segment fault.
>>>>
>>>> Add patch to parse macro files first to fix this problem.
>>>>
>>>> [YOCTO #3656]
>>>>
>>>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>>>> ---
>>>> .../rpm/rpm/rpm2cpio-fix-segmentation-fault.patch | 24
>>>> ++++++++++++++++++++
>>>> meta/recipes-devtools/rpm/rpm_5.4.9.bb | 3 +-
>>>> 2 files changed, 26 insertions(+), 1 deletions(-)
>>>> create mode 100644
>>>> meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patch
>>>>
>>>> diff --git
>>>> a/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patc=
h
>>>> b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patc=
h
>>>> new file mode 100644
>>>> index 0000000..b43a64e
>>>> --- /dev/null
>>>> +++
>>>> b/meta/recipes-devtools/rpm/rpm/rpm2cpio-fix-segmentation-fault.patc=
h
>>>> @@ -0,0 +1,24 @@
>>>> +Upstream-Status: Pending
>>>> +
>>>> +rpm2cpio fails on target with "Segmentation fault". Because no
>>>> "_dbpath"
>>>> +defined, when query it will cause seg fault.
>>>> +Parse macro files first to fix this bug.
>>>> +
>>>> +[YOCTO #3656]
>>>> +
>>>> +Signed-off-by: Kang Kai <kai.kang@windriver.com>
>>>> +
>>>> +--- rpm-5.4.9/tools/rpm2cpio.c.orig 2013-02-28 13:14:12.453540767=20
>>>> +0800
>>>> ++++ rpm-5.4.9/tools/rpm2cpio.c 2013-02-28 15:09:41.685785192 +0800
>>>> +@@ -88,6 +88,11 @@ int main(int argc, char **argv)
>>>> + (void) rpmtsSetVSFlags(ts, vsflags);
>>>> +
>>>> + /*@-mustmod@*/ /* LCL: segfault */
>>>> ++ rc =3D rpmReadConfigFiles(NULL, NULL);
>>>> ++ if (rc) {
>>>> ++ fprintf(stderr, _("read RPM config files failed\n"));
>>>> ++ exit(EXIT_FAILURE);
>>>> ++ }
>>>> + rc =3D rpmReadPackageFile(ts, fdi, "rpm2cpio", &h);
>>>> + /*@=3Dmustmod@*/
>>>> +
>>>
>>
>> Hi Mark,
>>
>> Sorry for missed this mail.
>>
>>> In the RPM2CPIO case, I'm not sure that we want to exit here. It's
>>> certainly reasonable for the config files to be unavailable to us.
>>
>> How about just give warning without quit when read configure files=20
>> fails?
>
> We shouldn't even need a warning.  When rpm2cpio is used on a target,=20
> much of the time there is no associated RPM in use (or if it's=20
> available, there likely isn't a database/home configured.)
>
>>>
>>> If the problem is that _dbpath is undefined (and it's needed for some
>>> reason), my suggestion is that "some value" be defined, even if it's
>>> to a non-existent location. It's be even better if we could simply
>>> avoid using the _dbpath at all in the rpm2cpio code.
>>
>> The segment fault occurs on executing rpmReadPackageFile(). It is a
>> library function in rpmdb/package.c. And it finally calls rpmdbNew(),
>> and in rpmdbNew() it calls:
>>
>> db->db_home =3D rpmdbURIPath( (home && *home ? home : _DB_HOME) );
>>
>> home passed in is NULL, and _DB_HOME is defined by:
>>
>> #define _DB_HOME "%{?_dbpath}"
>

Hi Mark,

> Instead of a warning above, if we were unable to load the database=20
> configuration, can we just set the value of _dbpath to be "/tmp"? =20
> This should provide a valid 'home' path for any temp files, as well as=20
> avoid any load problems.  If there is a configuration available, we=20
> can use it.

More vars found need to be set with a value. When run rpm2cpio, it calls=20
rpmReadPackageFile() to open the rpm file, and then do some read and=20
test work. When call rpmVerifySignature() it calls rpmdbOpen() and=20
finally calls db3new(). In function db3new() in rpmdb/dbconfig.c around=20
line 485, vars "_dbi_config_*" are expanded and var "_dbi_config" is=20
asserted not to be NULL. But without parsing the macros file, assertion=20
fails. "_dbi_config" is a complicated var and seems can not be set direct=
ly.

Would you like to give more help?

Thanks,
Kai

>
>> Then segment fault occurs with xstrdup() because no value is definedfo=
r
>> _dbpath then it tries to xstrdup() a NULL value in rpmdbURIPath().
>>
>> That is why I think parse configure files first in rpm2cpio is the way
>> to fix the issue.
>>
>> Regards,
>> Kai
>>
>>>
>>> (Note, to folks reading this. Normally in oe-core, if we use rpm2cpio=
,
>>> we're actually using a shell script version which does not have this
>>> problem. The rpm2cpio -binary- is used by people on the target or
>>> sometimes via the SDK to extract SRPM or RPM packages...)
>>>
>>>> diff --git a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>>> b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>>> index 39b0481..fcfbde8 100644
>>>> --- a/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>>> +++ b/meta/recipes-devtools/rpm/rpm_5.4.9.bb
>>>> @@ -43,7 +43,7 @@ LICENSE =3D "LGPLv2.1"
>>>> LIC_FILES_CHKSUM =3D
>>>> "file://COPYING.LIB;md5=3D2d5025d4aa3495befef8f17206a5b0a1"
>>>>
>>>> DEPENDS =3D "libpcre attr acl popt ossp-uuid file bison-native"
>>>> -PR =3D "r61"
>>>> +PR =3D "r62"
>>>>
>>>> # rpm2cpio is a shell script, which is part of the rpm src.rpm. It i=
s
>>>> needed
>>>> # in order to extract the distribution SRPM into a format we can
>>>> extract...
>>>> @@ -85,6 +85,7 @@ SRC_URI =3D
>>>> "http://www.rpm5.org/files/rpm/rpm-5.4/rpm-5.4.9-0.20120508.src.rpm;=
ex
>>>> file://rpm-reloc-macros.patch \
>>>> file://rpm-platform2.patch \
>>>> file://rpm-remove-sykcparse-decl.patch \
>>>> + file://rpm2cpio-fix-segmentation-fault.patch \
>>>> "
>>>>
>>>> # Uncomment the following line to enable platform score debugging
>>>>
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>>
>>
>
>


--=20
Regards,
Neil | Kai Kang



