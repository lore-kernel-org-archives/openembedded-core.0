Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 70DEB75532
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 23:00:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w7RN0wRX008400
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Tue, 28 Aug 2018 00:00:59 +0100
Message-ID: <5e5a13cb317d319f7ab9cb2a149881cd0adaa5d9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexandru Vasiu <alexandru.vasiu@ni.com>,
	openembedded-core@lists.openembedded.org
Date: Tue, 28 Aug 2018 00:00:58 +0100
In-Reply-To: <20180827143105.30059-3-alexandru.vasiu@ni.com>
References: <20180827143105.30059-1-alexandru.vasiu@ni.com>
	<20180827143105.30059-3-alexandru.vasiu@ni.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 3/3] image_types_wic: Add variable WIC_EXTENSION
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
X-List-Received-Date: Mon, 27 Aug 2018 23:00:59 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-08-27 at 17:31 +0300, Alexandru Vasiu wrote:
> Used to specify what extention will have the image file which
> is created using wic. The default value is wic. For creating an
> ISO image, WIC_EXTENSION will be iso.
> 
> Signed-off-by: Alexandru Vasiu <alexandru.vasiu@ni.com>
> ---
>  meta/classes/image.bbclass           | 2 ++
>  meta/classes/image_types_wic.bbclass | 3 ++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 024d2d4c96..c6833a6770 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -607,6 +607,8 @@ python create_symlinks() {
>      if not link_name:
>          return
>      for type in subimages:
> +        if type == 'wic':
> +            type = d.getVar('WIC_EXTENSION')
>          dst = os.path.join(deploy_dir, link_name + "." + type)
>          src = img_name + imgsuffix + type
>          if os.path.exists(os.path.join(deploy_dir, src)):

This is hardcoding an image type specific issue into common code. I
really want to avoid doing that.

In the past I started the process of trying to untangle the spaghetti
we had in image.bbclass and abstract it into common building blocks.
The hope was to eventually have proper APIs around this.

I never really got back to do further rounds of cleanup/improvement to
get to that goal but the more image type specific pieces we add back
in, the harder it will make those goals and the less maintainable the
coed will become.

So is there some other way we can handle this. It looks like we don't
even use this iso mode in OE-Core which is bad from a testing
perspective too? I don't see WIC_EXTENSION being set to iso anywhere?

Cheers,

Richard

