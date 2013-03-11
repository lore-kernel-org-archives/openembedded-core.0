Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UEyGp-00032o-Tn
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 09:39:49 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r2B8N66a023777
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Mar 2013 01:23:06 -0700 (PDT)
Received: from [128.224.162.205] (128.224.162.205) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Mon, 11 Mar 2013 01:23:06 -0700
Message-ID: <513D94D0.1000202@windriver.com>
Date: Mon, 11 Mar 2013 16:24:48 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
References: <cover.1362966448.git.kai.kang@windriver.com>
	<1eab6578b55eee05f36c14d1e536c793c5d80659.1362966448.git.kai.kang@windriver.com>
	<13d587c67be.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
In-Reply-To: <13d587c67be.2760.0f39ed3bcad52ef2c88c90062b7714dc@gmail.com>
X-Originating-IP: [128.224.162.205]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	r2B8N66a023777
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] insane.bbclass: make do_package_qa be a task
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
X-List-Received-Date: Mon, 11 Mar 2013 08:39:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2013=E5=B9=B403=E6=9C=8811=E6=97=A5 16:06, Bernhard Reutner-Fischer wr=
ote:
> On 11 March 2013 04:31:17 Kang Kai <kai.kang@windriver.com> wrote:
>> do_package_qa is added to variable PACKAGEFUNCS and run after
>> do_package. packaging tests should not ending up in package.bbclass.
>> Split do_package_qa as a new task after do_package.
>>
>> [YOCTO #3190]
>>
>> Signed-off-by: Kang Kai <kai.kang@windriver.com>
>> ---
>> meta/classes/insane.bbclass | 15 +++++++++++++--
>> 1 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
>> index bd6f120..d7787ac 100644
>> --- a/meta/classes/insane.bbclass
>> +++ b/meta/classes/insane.bbclass
>> @@ -17,9 +17,9 @@
>> # files under exec_prefix
>>
>>
>> -inherit package
>> +#inherit package
>> PACKAGE_DEPENDS +=3D "${QADEPENDS}"
>> -PACKAGEFUNCS +=3D " do_package_qa "
>> +#PACKAGEFUNCS +=3D " do_package_qa "
>
> I'd remove those lines, they are in the history anyway.
>
>>
>> # unsafe-references-in-binaries requires prelink-rtld from
>> # prelink-native, but we don't want this DEPENDS for -native builds
>> @@ -654,6 +654,15 @@ def package_qa_walk(path, warnfuncs, errorfuncs,=20
>> skip, package, d):
>> target_os =3D d.getVar('TARGET_OS', True)
>> target_arch =3D d.getVar('TARGET_ARCH', True)
>>
>> + pkgfiles =3D {}
>> + packages =3D d.getVar('PACKAGES', True).split()
>> + pkgdest =3D d.getVar('PKGDEST', True)
>> + for pkg in packages:
>> + pkgfiles[pkg] =3D []
>> + for walkroot, dirs, files in os.walk(pkgdest + "/" + pkg):
>

Hi Bernhard,

> I'd use os.sep above, too.
> I would ACK the patch with these changes, fwiw.

Thanks for your review, and I will update patch.

Regards,
Kai


> Thanks,
>> + for file in files:
>> + pkgfiles[pkg].append(walkroot + os.sep + file)
>> +
>> warnings =3D []
>> errors =3D []
>> for path in pkgfiles[package]:
>> @@ -823,6 +832,8 @@ python do_package_qa () {
>> bb.note("DONE with PACKAGE QA")
>> }
>>
>> +addtask package_qa after do_package before do_build
>> +EXPORT_FUNCTIONS do_package_qa
>>
>> python do_qa_staging() {
>> bb.note("QA checking staging")
>> --=20
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> Sent with AquaMail for Android
> http://www.aqua-mail.com
>
>
>



