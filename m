Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RzN3K-0003ZO-JO
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Feb 2012 07:48:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1K6eT6T010948
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 19 Feb 2012 22:40:29 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 19 Feb 2012 22:40:29 -0800
Message-ID: <4F41EAD7.3030009@windriver.com>
Date: Mon, 20 Feb 2012 14:40:23 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <4F21BE12.3000008@linux.intel.com>
	<4F24F672.5090107@linux.intel.com> <4F38E8CB.6090101@windriver.com>
	<4F3A9118.8050806@linux.intel.com>
	<4F3BCE0C.10400@linux.intel.com> <4F3C59A8.209@windriver.com>
	<4F3EE848.80703@linux.intel.com>
In-Reply-To: <4F3EE848.80703@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q1K6eT6T010948
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] Source Archiver Class
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
X-List-Received-Date: Mon, 20 Feb 2012 06:48:51 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B402=E6=9C=8818=E6=97=A5 07:52, Saul Wold wrote:
>
> Xiaofeng & Community:
>
> We had a chat with Chris Larson and Mark Hatle here at ELC.
>
> We focused this issue down to a fewer number of options that meet the=20
> needs of the licenses.  Please review this and let us know if there=20
> are any issues or concerns.
>
>
Hi Saul,

I comment my understanding as follow:
> Best Practices:
>  - Archive during build, we do not support nor recommend post archiving
>  - Original tarball and patches w/ordering file (maybe comment the
>    series), grab non-patch files also.
         for example:
         file://a.patch
         file://b.config.in
         we also archive b.config.in.
>  - Unless requesting configured sources, which will just be the
>    configured source tarball
>  - Grab temp as postfunc of do_package - latest logs via links & pid
>
        That means logs package include all of logs in temp. for example.
        You has described a following function we will realize at the=20
previous email.
       3 - Original Source code & Patches & temp (scripts & logs)

        source codes and patches should be in the stage=20
do_patch[postfunc] =3D " do_get_source"
        logs should be in the stage do_package[postfunc] =3D " do_get_log=
s"
        So logs file shouldn't be archived in do_patch[postfunc] =3D "=20
do_get_logs"
        The logs in the stage of do_packge are more than do_patch.

> For sstate Builds (LATER):
>  - need to verify that fetch/patch/configure will get re-run for=20
> archiving
>  - Add temp dir to sstate capture (without links)
>
> 3 Implementations classes
>  - Filter in oe/lib/license.py
>  - source_archive.bb
>    - archives tarballs to ${BP}/...
>    - reuse copyleft_compliance for patch handling
>  - srpm
>    - take output from above and create SRPM - (LATER)
>
We will do the archive  work according the license .  I will implement=20
two functions, one is for left, the other for right.
> 2 Configuration classes
>  - uses prefunc/postfunc at correct place
>  - Original Tarball / Patches
>  - Post Configuration
>
We can define 8 classes to complete  8 kinds of archiving methods. =20
every class will inherit archiver.bbclass.
and then realize do_stage[prefunc/postfunc] in this class.
stage include unpack, patch, configure, build package and so on.
for example. we want only to get original tarball, then we can define a=20
bbclass named "source.bbclass"
source.bbclass:
   inherit archiver.bbclass
   do_unpack[postfunc] =3D " do_get_source"

if we want to get both original and patches tarball, then we can define=20
bbclass names "source_patches.bbclass"
source_patches.bbclass
    inherit archiver.bbclass
    do_unpack[postfunc] =3D " do_get_source_patches"

> SOURCE_ARCHIVE_PACKAGE_TYPE =3D {tar, srpm}
> SOURCE_ARCHIVE_LOG =3D {True, False}
>
> Please let us know if you have any questions.
>
> Sau!
>
If my understanding don't meet your ideas, Please correct me.

Thanks for your help very much.

Thanks
Yan
> On 02/15/2012 05:19 PM, Xiaofeng Yan wrote:
>


