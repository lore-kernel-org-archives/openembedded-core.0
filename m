Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 2028D731D7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 16:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8CGhTcN017097; Mon, 12 Sep 2016 17:43:29 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id UljBMq-Hh6ay; Mon, 12 Sep 2016 17:43:29 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8CGhOYi017073
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Sep 2016 17:43:26 +0100
Message-ID: <1473698604.7207.4.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>
Date: Mon, 12 Sep 2016 17:43:24 +0100
In-Reply-To: <CANwerB1hTME1C=F+BA=xAC7Zx+mFP79EOTnw+HmUyi4Z6b6S7Q@mail.gmail.com>
References: <20160911121416.31304-1-net147@gmail.com>
	<1473675573.20226.364.camel@linuxfoundation.org>
	<CANwerB1hTME1C=F+BA=xAC7Zx+mFP79EOTnw+HmUyi4Z6b6S7Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image.bbclass: Do not expand variables in IMAGE_CMD vardepsexclude
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
X-List-Received-Date: Mon, 12 Sep 2016 16:43:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2016-09-13 at 00:05 +1000, Jonathan Liu wrote:
> Hi Richard,
> 
> On 12 September 2016 at 20:19, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > 
> > On Sun, 2016-09-11 at 22:14 +1000, Jonathan Liu wrote:
> > > 
> > > This fixes tashhash mismatch errors creating images when
> > > IMAGE_CMD
> > > references a variable whose value is always changing even though
> > > the
> > > variable is specified in IMAGE_CMD vardepsexclude.
> > > 
> > > Signed-off-by: Jonathan Liu <net147@gmail.com>
> > > ---
> > >  meta/classes/image.bbclass | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/meta/classes/image.bbclass
> > > b/meta/classes/image.bbclass
> > > index 8c8b8a2..f85ea86 100644
> > > --- a/meta/classes/image.bbclass
> > > +++ b/meta/classes/image.bbclass
> > > @@ -441,6 +441,10 @@ python () {
> > >          localdata.delVar('DATETIME')
> > >          localdata.delVar('TMPDIR')
> > > 
> > > +        vardepsexclude = d.getVarFlag('IMAGE_CMD',
> > > 'vardepsexclude',
> > > True) or ''
> > > +        vardepsexclude += ' ' + (d.getVarFlag('IMAGE_CMD_' +
> > > realt,
> > > 'vardepsexclude', True) or '')
> > > +        for var in vardepsexclude.split():
> > > +            localdata.delVar(var)
> > >          image_cmd = localdata.getVar("IMAGE_CMD", True)
> > >          vardeps.add('IMAGE_CMD_' + realt)
> > >          if image_cmd:
> > I think this is complicating an already fragile situation and it
> > worries me. Can you be more specific about which variable is
> > causing
> > problems here?
> See IMAGEDATESTAMP variable in:
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-raspberrypi/tree/clas
> ses/sdcard_image-rpi.bbclass
> https://github.com/linux-sunxi/meta-sunxi/blob/master/classes/sdcard_
> image-sunxi.bbclass
> 
> You can test by changing to:
> IMAGEDATESTAMP = "${@time.clock()}"

I appreciate this doesn't solve the underlying problem but is there a
reason they can't just use ${DATE} there?

I mention this since DATE/TIME are handled by bitbake specially so that
for example if your build rolls over midnight, it doesn't explode
badly. If your images is generated pre midnight but them processed
afterwards, I can see things working badly for that code...

Cheers,

Richard

