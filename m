Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 1D93171AC5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Dec 2017 18:07:50 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	vBJI7ov6009533
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Tue, 19 Dec 2017 18:07:51 GMT
Message-ID: <1513706870.16507.68.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Date: Tue, 19 Dec 2017 18:07:50 +0000
In-Reply-To: <CAP9ODKr8jOy7cWdAG4Trhv++X2V3HP7-NO=Ksums0M4ybZf4oA@mail.gmail.com>
References: <20171219171706.396-1-otavio@ossystems.com.br>
	<1513704140.16507.66.camel@linuxfoundation.org>
	<CAP9ODKr8jOy7cWdAG4Trhv++X2V3HP7-NO=Ksums0M4ybZf4oA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types_wic.bbclass: Ensure '-c image_wic' works
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
X-List-Received-Date: Tue, 19 Dec 2017 18:07:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2017-12-19 at 15:38 -0200, Otavio Salvador wrote:
> On Tue, Dec 19, 2017 at 3:22 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Tue, 2017-12-19 at 15:17 -0200, Otavio Salvador wrote:
> > > 
> > > The 'wic' image may use files which has been deployed (e.g in
> > > do_deploy) for some partitions that may need to be copied in a
> > > specific partition or filesystem (e.g a bootloader).
> > > 
> > > When using 'bitbake <image> -c image_wic', from a clean build,
> > > the
> > > contents of do_deploy must also be available so we need to ensure
> > > all
> > > do_build of the image dependencies has been complete.
> > > 
> > > Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
> > > Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> > > ---
> > > 
> > >  meta/classes/image_types_wic.bbclass | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/meta/classes/image_types_wic.bbclass
> > > b/meta/classes/image_types_wic.bbclass
> > > index 222ae00433..4d7305a3a3 100644
> > > --- a/meta/classes/image_types_wic.bbclass
> > > +++ b/meta/classes/image_types_wic.bbclass
> > > @@ -41,6 +41,9 @@ WKS_FILE_CHECKSUM = "${@'${WKS_FULL_PATH}:%s' %
> > > os.path.exists('${WKS_FULL_PATH}
> > >  do_image_wic[file-checksums] += "${WKS_FILE_CHECKSUM}"
> > >  do_image_wic[depends] += "${@' '.join('%s-
> > > native:do_populate_sysroot' % r for r in ('parted', 'gptfdisk',
> > > 'dosfstools', 'mtools'))}"
> > > 
> > > +# We ensure all artfacts are deployed (e.g virtual/bootloader)
> > > +do_image_wic[recrdeptask] += "do_build"
> > Shouldn't that be do_deploy instead of do_build?
> Not all recipes has do_deploy. Wouldn't it cause problems?

No, its designed to handle that:

$ grep recrdep * -R | grep deploy
meta/classes/populate_sdk_ext.bbclass:do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
meta/classes/archiver.bbclass:do_deploy_all_archives[recrdeptask] = "do_deploy_archives"
meta/classes/populate_sdk_ext.bbclass.orig:do_sdk_depends[recrdeptask] += "do_populate_lic do_package_qa do_populate_sysroot do_deploy ${SDK_RECRDEP_TASKS}"
meta/classes/base.bbclass:do_build[recrdeptask] += "do_deploy"

Cheers,

Richard

