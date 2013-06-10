Return-Path: <ap.john.stirling@gmail.com>
Received: from mail-we0-f174.google.com (mail-we0-f174.google.com
	[74.125.82.174])
	by mail.openembedded.org (Postfix) with ESMTP id AD7B16A5C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 16:20:32 +0000 (UTC)
Received: by mail-we0-f174.google.com with SMTP id q58so5003031wes.19
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 09:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=NY8bfxwm9IeSSIq36pdF35QL6G/c3zUfn3i1cDXHoAQ=;
	b=ZHwJNmPiOaaPEfmQGsz6tF79AMxw6m93x6AlgSVWoLMycgoFF2EjQWkON2YQLK5hd2
	Y4A9/c2S+lUTjQiBwKMmNjs8ShRa4QmtY771uP8wLLNKs2IZwQE67ifpYUFmaqI8Ycyd
	H6ZOFB0zT4GzdhKWwQZFmJNKK3KCzcFRUf8xEXKBWS0HTe0ODJQDLp0DBKoi2tZwBD5n
	4r/OD2U4bv3q1CgAjg96VQdc7NgyL7kLATz17NFi2y3OR2CQ37ZuGl5sKHqljcGF4hbO
	nqjXP/LesHDfZTKe6yRNrEPWVt5SxHa98NwnF8zgjx3ihBcZNzg3IyNp7IWg31tCjj1l
	vxKw==
MIME-Version: 1.0
X-Received: by 10.194.174.38 with SMTP id bp6mr1949148wjc.83.1370881233057;
	Mon, 10 Jun 2013 09:20:33 -0700 (PDT)
Received: by 10.194.121.229 with HTTP; Mon, 10 Jun 2013 09:20:32 -0700 (PDT)
In-Reply-To: <1742399.JSmCq3b5r2@helios>
References: <CABuzA3PAguwK=KW7xnoe6PJqASWZXktBLB5LTs7LHcw5mopXJQ@mail.gmail.com>
	<1442698.2y5IVPznBc@helios>
	<CABuzA3OXwzQBeYJ4D5kGYANTNykOPnOR4BDrj3=y9TauD1Z5hg@mail.gmail.com>
	<1742399.JSmCq3b5r2@helios>
Date: Mon, 10 Jun 2013 17:20:32 +0100
Message-ID: <CABuzA3PgXE1ZQ_weya3=KeatkEtDY7ZfsgFp2s7KHzKgzun1-w@mail.gmail.com>
From: John Stirling <ap.john.stirling@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: qt4-embedded - image size
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
X-List-Received-Date: Mon, 10 Jun 2013 16:20:33 -0000
Content-Type: multipart/alternative; boundary=089e0141aa2aed009704decf28a6

--089e0141aa2aed009704decf28a6
Content-Type: text/plain; charset=ISO-8859-1

Thanks Paul. Fonts all ok now.

For the benefit of anyone else listening here's what I ended up with

IMAGE_INSTALL += " \
  qt4-embedded-fonts-ttf-vera \
  qtui \
  "

ttf-vera fonts are about 500k in total, but could be cut down to ~100k in
my case as I don't really need italics (eg just use Vera.ttf and VeraBd.ttf)

Qt libraries were about 25Mb in total which I expect could be reduced a
bit, but think I have enough information for now.



On 10 June 2013 15:03, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:

> On Monday 10 June 2013 14:46:57 John Stirling wrote:
> > Looking fairly promising so far. Image size down from 280Mb to 90Mb and
> > only Qt related stuff now seems to be in /usr/lib/
> >
> > The font's seem to be missing though -
> > QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt
> installed
> > correctly?
> > We won't need all the fonts in any case but would you expect them to have
> > been pulled in automatically ?
>
> Right, for Qt/E if you are displaying any text you'll need to explicitly
> install the package for this since nothing depends upon it. You can install
> the qt4-embedded-fonts package which brings in all fonts that are
> distributed
> with Qt, or alternatively you can install only the fonts you want (qt4-
> embedded-fonts-ttf-vera, etc.)
>
> > Pretty sure I need the first 3, but not sure about the rest. Does that
> look
> > about right to you size wise ? We're just trying to tie down flash sizes
> at
> > the moment and want to get a fairly accurate estimate for Qt.
>
> This looks reasonable to me. Note however if you start changing some of the
> build-time configuration options for Qt you may be able to disable a few
> things
> you don't need. Have a look at Qt's configuration options [1]. You can see
> exactly which options are being used to build Qt with:
>
> bitbake -e | grep "^QT_CONFIG_FLAGS="
>
> If you search for QT_CONFIG_FLAGS under meta/recipes-qt/qt4/ you'll see how
> this variable gets set.
>
> > I guess also at some point we might want to switch to Qt5. Is that
> > comparable in size ?
>
> Not sure I'm afraid, although I believe it is more modular so in theory you
> should be able to cut out more pieces you don't need.
>
> Cheers,
> Paul
>
> [1] http://qt-project.org/doc/qt-4.8/configure-options.html
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

--089e0141aa2aed009704decf28a6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div><div>Thanks Paul. Fonts all ok now.=A0</div><div><br></div><div>For th=
e benefit of anyone else listening here&#39;s what I ended up with</div><di=
v><br></div><div>IMAGE_INSTALL +=3D &quot; \</div><div>=A0 qt4-embedded-fon=
ts-ttf-vera \</div>
<div>=A0 qtui \</div><div>=A0 &quot;</div></div><div><br></div><div>ttf-ver=
a fonts are about 500k in total, but could be cut down to ~100k in my case =
as I don&#39;t really need italics (eg just use Vera.ttf and VeraBd.ttf)</d=
iv>
<div><br></div><div>Qt libraries were about 25Mb in total which I expect co=
uld be reduced a bit, but think I have enough information for now.</div><di=
v><br></div><div><br></div><br><div class=3D"gmail_quote">On 10 June 2013 1=
5:03, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@l=
inux.intel.com" target=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</sp=
an> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On Monday 10 June 2013 14:=
46:57 John Stirling wrote:<br>
&gt; Looking fairly promising so far. Image size down from 280Mb to 90Mb an=
d<br>
&gt; only Qt related stuff now seems to be in /usr/lib/<br>
&gt;<br>
&gt; The font&#39;s seem to be missing though -<br>
&gt; QFontDatabase: Cannot find font directory /usr/lib/fonts - is Qt insta=
lled<br>
&gt; correctly?<br>
&gt; We won&#39;t need all the fonts in any case but would you expect them =
to have<br>
&gt; been pulled in automatically ?<br>
<br>
</div>Right, for Qt/E if you are displaying any text you&#39;ll need to exp=
licitly<br>
install the package for this since nothing depends upon it. You can install=
<br>
the qt4-embedded-fonts package which brings in all fonts that are distribut=
ed<br>
with Qt, or alternatively you can install only the fonts you want (qt4-<br>
embedded-fonts-ttf-vera, etc.)<br>
<div class=3D"im"><br>
&gt; Pretty sure I need the first 3, but not sure about the rest. Does that=
 look<br>
&gt; about right to you size wise ? We&#39;re just trying to tie down flash=
 sizes at<br>
&gt; the moment and want to get a fairly accurate estimate for Qt.<br>
<br>
</div>This looks reasonable to me. Note however if you start changing some =
of the<br>
build-time configuration options for Qt you may be able to disable a few th=
ings<br>
you don&#39;t need. Have a look at Qt&#39;s configuration options [1]. You =
can see<br>
exactly which options are being used to build Qt with:<br>
<br>
bitbake -e | grep &quot;^QT_CONFIG_FLAGS=3D&quot;<br>
<br>
If you search for QT_CONFIG_FLAGS under meta/recipes-qt/qt4/ you&#39;ll see=
 how<br>
this variable gets set.<br>
<div class=3D"im"><br>
&gt; I guess also at some point we might want to switch to Qt5. Is that<br>
&gt; comparable in size ?<br>
<br>
</div>Not sure I&#39;m afraid, although I believe it is more modular so in =
theory you<br>
should be able to cut out more pieces you don&#39;t need.<br>
<br>
Cheers,<br>
Paul<br>
<br>
[1] <a href=3D"http://qt-project.org/doc/qt-4.8/configure-options.html" tar=
get=3D"_blank">http://qt-project.org/doc/qt-4.8/configure-options.html</a><=
br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
--<br>
<br>
Paul Eggleton<br>
Intel Open Source Technology Centre<br>
</div></div></blockquote></div><br>

--089e0141aa2aed009704decf28a6--
