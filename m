Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id AC0F47803F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jan 2018 10:55:00 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w03AsxW4005983
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Wed, 3 Jan 2018 10:55:00 GMT
Message-ID: <1514976899.5525.120.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alistair Francis <alistair.francis@xilinx.com>,
	openembedded-core@lists.openembedded.org
Date: Wed, 03 Jan 2018 10:54:59 +0000
In-Reply-To: <20180102224935.23756-1-alistair.francis@xilinx.com>
References: <20180102224935.23756-1-alistair.francis@xilinx.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] glib-2.0: Remove python3 modules when building for mingw
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
X-List-Received-Date: Wed, 03 Jan 2018 10:55:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-01-02 at 14:49 -0800, Alistair Francis wrote:
> Commit "glib-2.0: Add python3 modules required by gdbus-codegen"
> (26af3b4b33a34d7e53059b07236f9d5aae5e004a) broke the MinGW build of
> QEMU. To fix the build remove the python3 RDEPENDS for gdbus-codegen
> when targeting mingw.
> 
> Signed-off-by: Alistair Francis <alistair.francis@xilinx.com>
> ---
>  meta/recipes-core/glib-2.0/glib.inc | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-
> core/glib-2.0/glib.inc
> index fbc655a012..f8e803a90a 100644
> --- a/meta/recipes-core/glib-2.0/glib.inc
> +++ b/meta/recipes-core/glib-2.0/glib.inc
> @@ -121,6 +121,12 @@ RDEPENDS_${PN}-codegen += "\
>              python3-xml \
>             "
>  
> +RDEPENDS_${PN}-codegen_remove_mingw32 = "\
> +            python3 \
> +            python3-distutils \
> +            python3-xml \
> +           "
> +
>  RDEPENDS_${PN}-ptest += "\
>              dbus \
>              gnome-desktop-testing \

I have pretty strong feelings that we shouldn't be using remove like
this, or duplicating data. Its susceptible to breakage when one value
changes and the other does not. Can you rework this so it doesn't use
remove, or duplicate data?

In case its not clear, you can do something like:

CODEGEN_PYTHON_RDEPENDS = "python3 python3-distutils python3-xml"
CODEGEN_PYTHON_RDEPENDS_mingw32 = ""

RDEPENDS_${PN}-codegen += "${CODEGEN_PYTHON_RDEPENDS}"

which is much more maintainable.

Cheers,

Richard

