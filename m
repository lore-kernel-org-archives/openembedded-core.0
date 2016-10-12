Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9096FFCE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2016 08:20:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u9C8KfLM000424
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Oct 2016 01:20:41 -0700 (PDT)
Received: from [128.224.162.240] (128.224.162.240) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 12 Oct 2016 01:20:38 -0700
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
References: <cover.1476253865.git.liezhi.yang@windriver.com>
	<239ab1764ad811a12d8da6eb66ced3fff9987891.1476253865.git.liezhi.yang@windriver.com>
	<CAHiDW_HLG6fa7Phu0TeM+f5LTuubA2RmZB-6795Ze5e4xAqGxA@mail.gmail.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <3be5edc5-aaf8-1c61-6f2a-c398cbaeb010@windriver.com>
Date: Wed, 12 Oct 2016 16:20:37 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAHiDW_HLG6fa7Phu0TeM+f5LTuubA2RmZB-6795Ze5e4xAqGxA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] xcb-proto: create .pyc files for python2
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
X-List-Received-Date: Wed, 12 Oct 2016 08:20:45 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/12/2016 04:00 PM, Jussi Kukkonen wrote:
> On 12 October 2016 at 09:31, Robert Yang <liezhi.yang@windriver.com
> <mailto:liezhi.yang@windriver.com>> wrote:
>
>     Its Makefile's do_install creates .pyc files for python3, now also
>     create them for python2 so that they will be recorded by manifest, and
>     can be cleaned correctly.
>
>
> So this is about autotools byte-compiling for python3 at install time and then
> something using those python modules with python2 during the build?

Yes.

>
> I wonder if this is something that should/can be solved in a more generic way?
> Alternatively, is the xcbgen user something in oe-core and can we tell it to not
> use python2?

The only one in oe-core which used python2 to invoke xcb-proto's python
modules was libxcb, and I've fixed it to use python3, but we don't know
which one uses python2 out of oe-core, so I also fix xcb-proto for python2.

// Robert

>
> - Jussi
>
>
>
>
>     Signed-off-by: Robert Yang <liezhi.yang@windriver.com
>     <mailto:liezhi.yang@windriver.com>>
>     ---
>      meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
>     <http://xcb-proto_1.12.bb> | 8 ++++++++
>      1 file changed, 8 insertions(+)
>
>     diff --git a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
>     <http://xcb-proto_1.12.bb>
>     b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb <http://xcb-proto_1.12.bb>
>     index 8bdca32..54988fc 100644
>     --- a/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
>     <http://xcb-proto_1.12.bb>
>     +++ b/meta/recipes-graphics/xorg-proto/xcb-proto_1.12.bb
>     <http://xcb-proto_1.12.bb>
>     @@ -28,3 +28,11 @@ RDEPENDS_${PN}-dev = ""
>      RRECOMMENDS_${PN}-dbg = "${PN}-dev (= ${EXTENDPKGV})"
>
>      BBCLASSEXTEND = "native nativesdk"
>     +
>     +do_install_append() {
>     +    # Makefile's do_install creates .pyc files for python3, now also create
>     +    # them for python2 so that they will be recorded by manifest, and can be
>     +    # cleaned correctly.
>     +    cd  ${D}${libdir}/xcb-proto/xcbgen
>     +    python -m py_compile *.py
>     +}
>     --
>     2.9.0
>
>     --
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
>     <http://lists.openembedded.org/mailman/listinfo/openembedded-core>
>
>

