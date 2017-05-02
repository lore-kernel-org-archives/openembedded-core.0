Return-Path: <juro.bystricky@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 88FE672F4F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 May 2017 00:35:35 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 01 May 2017 17:35:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,402,1488873600"; d="scan'208";a="1125447120"
Received: from orsmsx104.amr.corp.intel.com ([10.22.225.131])
	by orsmga001.jf.intel.com with ESMTP; 01 May 2017 17:35:36 -0700
Received: from orsmsx112.amr.corp.intel.com ([169.254.3.213]) by
	ORSMSX104.amr.corp.intel.com ([169.254.4.196]) with mapi id
	14.03.0319.002; Mon, 1 May 2017 17:35:36 -0700
From: "Bystricky, Juro" <juro.bystricky@intel.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: [PATCH v2 1/6] bitbake.conf: new variable
	BUILD_REPRODUCIBLE_BINARIES
Thread-Index: AQHSwr3GXhkyTfFYMkSrAJf6bt3+hqHgkOWA//+f5BE=
Date: Tue, 2 May 2017 00:35:35 +0000
Message-ID: <6E51916E4A1F32428260031F4C7CD2B611950590@ORSMSX112.amr.corp.intel.com>
References: <1493672344-21965-1-git-send-email-juro.bystricky@intel.com>
	<1493672344-21965-2-git-send-email-juro.bystricky@intel.com>,
	<1493680397.23535.47.camel@linuxfoundation.org>
In-Reply-To: <1493680397.23535.47.camel@linuxfoundation.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.3.86.139]
MIME-Version: 1.0
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>
Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_BINARIES
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
X-List-Received-Date: Tue, 02 May 2017 00:35:36 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I see your point. The original idea was to keep all related variables in on=
e place. There is =0A=
one variable ( BUILD_REPRODUCIBLE_BINARIES ) that I think should be global,=
=0A=
as it should be visible by all tasks (well, a lot of tasks). The rest can b=
e moved to more appropriate places.=0A=
=0A=
=0A=
________________________________________=0A=
From: Richard Purdie [richard.purdie@linuxfoundation.org]=0A=
Sent: Monday, May 01, 2017 4:13 PM=0A=
To: Bystricky, Juro; openembedded-core@lists.openembedded.org=0A=
Cc: joshua.g.lock@linux.intel.com; Burton, Ross; martin.jansa@gmail.com; ra=
j.khem@gmail.com; jurobystricky@hotmail.com=0A=
Subject: Re: [PATCH v2 1/6] bitbake.conf: new variable BUILD_REPRODUCIBLE_B=
INARIES=0A=
=0A=
On Mon, 2017-05-01 at 13:58 -0700, Juro Bystricky wrote:=0A=
> Building reproducible binaries may remove certain intentional=0A=
> randomness intended for increased security. Hence, it is reasonable=0A=
> to expect there will be cases where this is not desirable.=0A=
> The user can select his/her preferences via the variable=0A=
> BUILD_REPRODUCIBLE_BINARIES. The variable defaults to "0" (do not=0A=
> build reproducible binaries) in order to minimize any potential=0A=
> regressions. (Once the reproducible binaries code is mature enough,=0A=
> it can be set to "1".)=0A=
> If the variable BUILD_REPRODUCIBLE_BINARIES is set to "1",=0A=
> timestamp values taken from additional variables will be optionally=0A=
> used=0A=
> when building binary reproducible images:=0A=
>=0A=
>     REPRODUCIBLE_TIMESTAMP_ROOTFS=0A=
>         If the value is specified, all files mtime will be set to=0A=
> this value.=0A=
>         In addition, /etc/timestamp and /etc/version will both=0A=
> contain the value.=0A=
>         If no value is specified, timestamp will be derived from the=0A=
> top git commit.=0A=
>=0A=
>     REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK=0A=
>         Value passed via environment variable PRELINK_TIMESTAMP to=0A=
> the prelink program.=0A=
>         If the value is specified, the value will be used.=0A=
>         If no value is specified, timestamp will be derived from the=0A=
> top git commit.=0A=
>=0A=
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>=0A=
> ---=0A=
>  meta/conf/bitbake.conf | 11 +++++++++++=0A=
>  1 file changed, 11 insertions(+)=0A=
>=0A=
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf=0A=
> index 227babd..6ce1a1a 100644=0A=
> --- a/meta/conf/bitbake.conf=0A=
> +++ b/meta/conf/bitbake.conf=0A=
> @@ -859,3 +859,14 @@ BB_SIGNATURE_EXCLUDE_FLAGS ?=3D "doc deps depends=0A=
> \=0A=
>=0A=
>  MLPREFIX ??=3D ""=0A=
>  MULTILIB_VARIANTS ??=3D ""=0A=
> +=0A=
> +BUILD_REPRODUCIBLE_BINARIES ??=3D "0"=0A=
> +BUILD_REPRODUCIBLE_BINARIES[export] =3D "1"=0A=
> +=0A=
> +# Unix timestamp=0A=
> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D ""=0A=
> +REPRODUCIBLE_TIMESTAMP_ROOTFS[export] =3D "1"=0A=
> +=0A=
> +# Unix timestamp=0A=
> +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK ??=3D ""=0A=
> +REPRODUCIBLE_TIMESTAMP_IMAGE_PRELINK[export] =3D "1"=0A=
=0A=
Please don't add new global exports in bitbake.conf. Changing the value=0A=
of this will cause everything to rebuild (e.g. recompile) since the=0A=
exported environment goes to all tasks. We really don't want to do that=0A=
if it only affects the image generation.=0A=
=0A=
I'll give this a bit more thought/review but wanted to comment on this=0A=
whilst I see it/remember.=0A=
=0A=
Cheers,=0A=
=0A=
Richard=0A=
=0A=

