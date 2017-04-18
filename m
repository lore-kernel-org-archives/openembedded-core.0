Return-Path: <Jackie.Huang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9689771AC9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 09:12:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v3I9CqdR022942
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Apr 2017 02:12:54 -0700
Received: from ALA-MBC.corp.ad.wrs.com ([fe80::fcbe:9b7:1141:89a1]) by
	ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0294.000;
	Tue, 18 Apr 2017 02:12:51 -0700
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [OE-core] [PATCH] ltp: fix an incorrect macro checking
Thread-Index: AQHSQgzec4AyRA4fdkawmPtgLNOU0qHLw0vg
Date: Tue, 18 Apr 2017 09:12:51 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA014B722147@ALA-MBC.corp.ad.wrs.com>
References: <20161119021100.29350-1-jackie.huang@windriver.com>
In-Reply-To: <20161119021100.29350-1-jackie.huang@windriver.com>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.176.111]
MIME-Version: 1.0
Subject: Re: [PATCH] ltp: fix an incorrect macro checking
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
X-List-Received-Date: Tue, 18 Apr 2017 09:12:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Ping.=20

It's not merged yet, and I don't see any rejection on it.

Thanks,
Jackie

> -----Original Message-----
> From: openembedded-core-bounces@lists.openembedded.org
> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
> jackie.huang@windriver.com
> Sent: Saturday, November 19, 2016 10:11
> To: openembedded-core@lists.openembedded.org
> Subject: [OE-core] [PATCH] ltp: fix an incorrect macro checking
>=20
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The previous patch added a check but incorrectly
> change the elif to if, then it always return 0
> for cpuid if the machine is not __i386__
>=20
> getcpu01    1  TFAIL  :  getcpu01.c:140: getcpu() returned wrong value ex=
pected
> cpuid:7, returned value cpuid: 0
>=20
> After this fix:
> getcpu01    1  TPASS  :  getcpu() returned proper cpuid:7, node id:0
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  .../0008-Check-if-__GLIBC_PREREQ-is-defined-before-using-it.patch  | 7 +=
+-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-i=
s-
> defined-before-using-it.patch b/meta/recipes-extended/ltp/ltp/0008-Check-=
if-
> __GLIBC_PREREQ-is-defined-before-using-it.patch
> index d123074..41f2623 100644
> --- a/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-
> defined-before-using-it.patch
> +++ b/meta/recipes-extended/ltp/ltp/0008-Check-if-__GLIBC_PREREQ-is-
> defined-before-using-it.patch
> @@ -88,22 +88,19 @@ index c927512..921b107 100644
>=20
>   void cleanup(void);
>   void setup(void);
> -@@ -164,9 +172,14 @@ static inline int getcpu(unsigned *cpu_id, unsigned
> *node_id,
> +@@ -164,7 +172,11 @@ static inline int getcpu(unsigned *cpu_id, unsigned
> *node_id,
>   {
>   #if defined(__i386__)
>   	return syscall(318, cpu_id, node_id, cache_struct);
>  -#elif __GLIBC_PREREQ(2,6)
> -+#if defined(__GLIBC__)
> ++#elif defined(__GLIBC__)
>  +#if __GLIBC_PREREQ(2,6)
>  +	*cpu_id =3D sched_getcpu();
>  +#endif
>  +#else
>   	*cpu_id =3D sched_getcpu();
>   #endif
> -+#endif
>   	return 0;
> - }
> -
>  @@ -191,15 +204,20 @@ unsigned int set_cpu_affinity(void)
>   	cpu_set_t *set;
>   	size_t size;
> --
> 2.8.3
>=20
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

