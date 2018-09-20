Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id B85D679202
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2018 14:04:32 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-MBX-03.mgc.mentorg.com)
	by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
	id 1g2zZJ-0006AY-Fx from Awais_Belal@mentor.com ;
	Thu, 20 Sep 2018 07:04:33 -0700
Received: from SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) by
	SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) with Microsoft SMTP
	Server (TLS) id 15.0.1320.4; Thu, 20 Sep 2018 15:04:11 +0100
Received: from SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17]) by
	SVR-IES-MBX-03.mgc.mentorg.com ([fe80::1072:fb6e:87f1:ed17%22]) with
	mapi id 15.00.1320.000; Thu, 20 Sep 2018 15:04:11 +0100
From: "Belal, Awais" <Awais_Belal@mentor.com>
To: "Burton, Ross" <ross.burton@intel.com>
Thread-Topic: [OE-core] [PATCH] glibc-package.inc: correct intention for
	deleting /usr/lib as needed
Thread-Index: AQHUTzrReK7EozvamEuUEKOJij+4eaT49cQAgABA2pg=
Date: Thu, 20 Sep 2018 14:04:11 +0000
Message-ID: <9a58ea4be84c4f0eb2c34680a9345186@SVR-IES-MBX-03.mgc.mentorg.com>
References: <1537266969204.31967@mentor.com>,
	<CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
In-Reply-To: <CAJTo0LbCJwoD8Rc4uLffTx5P0enQxppY4-5YmGYPDbhahU8j8A@mail.gmail.com>
Accept-Language: en-US, en-IE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.94.31.225]
MIME-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] glibc-package.inc: correct intention for deleting /usr/lib as needed
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
X-List-Received-Date: Thu, 20 Sep 2018 14:04:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Ross,

>> Can you resend using git-send-email, as this patch is encoded in HTML.
My SMTP server is acting up these days, should I simply resend the patch he=
re as an attachment?

BR,
Awais

________________________________________
From: Burton, Ross [ross.burton@intel.com]
Sent: Thursday, September 20, 2018 4:10 PM
To: Belal, Awais
Cc: OE-core
Subject: Re: [OE-core] [PATCH] glibc-package.inc: correct intention for del=
eting /usr/lib as needed

Can you resend using git-send-email, as this patch is encoded in HTML.

Ross
On Tue, 18 Sep 2018 at 11:53, Belal, Awais <Awais_Belal@mentor.com> wrote:
>
> In case the baselib is lib64 we would want to delete /usr/lib
> after removing the /usr/lib/locale dir and the implementation
> wanted to do that earlier as well but the fault was checking
> an already removed dir (/usr/lib/locale) before trying to
> remove /usr/lib as that check would always fail.
> Now we simply try to delete /usr/lib after deleting
> /usr/lib/locale to make sure it deletes cleanly and is empty
> at the time of deletion.
>
> Signed-off-by: Awais Belal <awais_belal@mentor.com>
> ---
>  meta/recipes-core/glibc/glibc-package.inc | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-cor=
e/glibc/glibc-package.inc
> index 9ea41b7..22a59d2 100644
> --- a/meta/recipes-core/glibc/glibc-package.inc
> +++ b/meta/recipes-core/glibc/glibc-package.inc
> @@ -207,11 +207,10 @@ do_poststash_install_cleanup () {
>      rm -rf ${D}/${localedir}
>      rm -rf ${D}${datadir}/locale
>      if [ "${libdir}" !=3D "${exec_prefix}/lib" ]; then
> -        if [ -d ${D}${exec_prefix}/lib/locale ] ; then
> -            rm -rf ${D}${exec_prefix}/lib/locale
> -            # error out if directory isn't empty
> -            rm -f ${D}${exec_prefix}/lib
> -        fi
> +        # error out if directory isn't empty
> +        # this dir should only contain locale dir
> +        # which has been deleted in the previous step
> +        rmdir ${D}${exec_prefix}/lib
>      fi
>  }
>  addtask do_poststash_install_cleanup after do_stash_locale do_install be=
fore do_populate_sysroot do_package
> --
> 2.7.4
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

