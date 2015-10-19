Return-Path: <s.christ@phytec.de>
Received: from root.phytec.de (mail.phycard.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 09F6977070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:03:01 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id A1EEAA00378;
	Mon, 19 Oct 2015 11:03:17 +0200 (CEST)
Received: from lws-christ ([172.16.11.80])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP2 HF590)
	with ESMTP id 2015101911030116-42293 ;
	Mon, 19 Oct 2015 11:03:01 +0200 
Date: Mon, 19 Oct 2015 11:03:01 +0200
From: Stefan Christ <s.christ@phytec.de>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Message-ID: <20151019090300.GC3869@lws-christ>
References: <1445242541-41638-1-git-send-email-s.christ@phytec.de>
	<1445242541-41638-2-git-send-email-s.christ@phytec.de>
	<CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP71Wjz2YEuj8qLEw63027bGcYKNAPOazv-8Rd+J5RQ2C50UKA@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP2
	HF590|December 11, 2014) at 19.10.2015 11:03:01,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP2 HF590|December 11,
	2014) at 19.10.2015 11:03:01
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/7] linux-dtb.inc: fix detection of ending '.dts'
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
X-List-Received-Date: Mon, 19 Oct 2015 09:03:04 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 19, 2015 at 10:27:52AM +0200, Nicolas Dechesne wrote:
> On Mon, Oct 19, 2015 at 10:15 AM, Stefan Christ <s.christ@phytec.de> wrot=
e:
> >
> > Device tree files ending with ".dts" are not recognized correctly
> > because of unnecessary front slashes.
> >
> > Signed-off-by: Stefan Christ <s.christ@phytec.de>
> > ---
> >  meta/recipes-kernel/linux/linux-dtb.inc | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-ker=
nel/linux/linux-dtb.inc
> > index ee3a5e1..db2afb8 100644
> > --- a/meta/recipes-kernel/linux/linux-dtb.inc
> > +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> > @@ -8,7 +8,7 @@ python =5F=5Fanonymous () {
> >  do=5Fcompile=5Fappend() {
> >         if test -n "${KERNEL=5FDEVICETREE}"; then
> >                 for DTB in ${KERNEL=5FDEVICETREE}; do
> > -                       if echo ${DTB} | grep -q '/dts/'; then
> > +                       if echo ${DTB} | grep -q 'dts'; then
>=20
>=20
>=20
> My understanding is that the '/dts/' was here to catch 'boot/dts/' in
> order to detect the absolute path name, not the trailing '.dts'. In
> which case this patch might not be appropriate.

Hmm, the meaning of the code seems to be non obvious. I just looked at sed
replacement and concluded that it's about the file name ending.

Using the full path to the dtb file is not supported by the code anyway, e.=
g.

   DTB=5FPATH=3D"${B}/arch/${ARCH}/boot/dts/${DTB}"

would be wrong.

So the correct solution would check both cases

   - full path or only filename and
   - ending is dts or dtb

Correct?

Mit freundlichen Gr=C3=BC=C3=9Fen / Kind regards,
	Stefan Christ


