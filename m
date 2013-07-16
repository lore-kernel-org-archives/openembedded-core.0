Return-Path: <nicolas.dechesne@linaro.org>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0EC336B215
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 16:40:03 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id i7so1124970oag.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 09:40:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=LM6GOnyYuvF8ASRPPShsYibmQW2ePprf6KsU36quoB8=;
	b=b+gZY0X4ddUkr9cSBL9IkX9tnJhXGQA7dEjnalUqcRNTe8evlp+rAwt4P6vo35UsMc
	7oyVppa44QF86jNQh+/IozzwG844GSG874FOb4a+sdMVR5jZ9ADyEwj+c7S1+IwAJzSI
	rHfJXoiYAYb1a3A1psxXdp6R5A5o5AdeLRZd6c7YTsr3SrsVkYDhBzzy0+jaeFe9is2p
	+PwGWQ0/+6sRwt8tjm0rwepPdjo7WZLpR0S9IYNIKmv0Tx0b7Vwpftg2+EFIfB4dxMR1
	XG7/csokFkbmpWkbQZVjIu0eQZxo4M2da4//gWO9JKp5+aTCoMV2DkC5jVm27MTcd/QY
	6lOg==
X-Received: by 10.60.133.235 with SMTP id pf11mr3009858oeb.38.1373992803737;
	Tue, 16 Jul 2013 09:40:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.76.126.144 with HTTP; Tue, 16 Jul 2013 09:39:43 -0700 (PDT)
In-Reply-To: <5246829.WLtotMrLQF@helios>
References: <1371653832-2178-1-git-send-email-jate.sujjavanich@myfuelmaster.com>
	<1409263.tPA0GAOlPL@helios>
	<6C2434209962DC46B88345CA85C334A201C9F4A6EBE9@Courier.syntech.org>
	<5246829.WLtotMrLQF@helios>
From: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Tue, 16 Jul 2013 18:39:43 +0200
Message-ID: <CAP71Wjwx4vAZg03JHSn1ikxRUgfhcJ2zXndb7rd_4QzEE96x=A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQkZA/ok0S9DCBmmlFEvVV3fKLF6BAHpWdiivIG2/+ASqt449IOQA87kvY6U/NpUq/qq/5Om
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Checksums for local files now stored using partial recipe path
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
X-List-Received-Date: Tue, 16 Jul 2013 16:40:04 -0000
Content-Type: multipart/alternative; boundary=047d7b419059fdad5304e1a3a0ce

--047d7b419059fdad5304e1a3a0ce
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jul 16, 2013 at 6:28 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> I just got around to trying this again, only this time I cloned a new poky
> tree in a different path which should replicate your situation and used
> SSTATE_MIRRORS to point to the previous sstate-cache. It built completely
> from
> sstate as it expected. For reference I was testing with the latest dylan
> branch and core-image-minimal.
>
> As I said earlier, if you look at the code only the checksum value goes
> into
> the task checksum and not the filename, so the path to the base of the
> metadata
> changing cannot influence the task checksum. However, I think I can see
> how you
> would think that the paths changing influenced the checksum, since the data
> that we put into the siginfo file *does* contain the full path, and thus
> bitbake-diffsigs will report that as having changed even though that
> difference
> didn't change the task checksum. That is a bug and we should fix how we
> store
> paths either in the cache or in the siginfo file, but that fix will have
> to take
> into account different layer paths. I'd suggest a simpler and more reliable
> approach would be to just get the relative path to os.path.dirname of the
> recipe rather than TOPDIR.
>
> As far as I can tell though that won't actually fix the issue triggering
> rebuilds in your case. Something else must be changing. It would be
> interesting if you could dig into what that might be as I can't reproduce
> the
> rebuilding issue here.
>

on a related topic, we have given a 'hands on workshop' last week at our
Linaro Conference. in order to avoid potential network issues and wasting
too much time building, we had prepared 'tarballs' for 1) download folder,
2) sstate

For sstate we have prepared a couple of such archive for OpenSuse and
Ubuntu (12.04, 13.04) for both 32-bit and 64-bit variants.

We used 'dylan' in our workshop since the archives were created a couple of
days before, to avoid new commits in master.

Interesting remarks:
 - 'download' archive worked nicely for everyone
 - 'sstate' archive worked for some people, but not everyone.

In my particular case I was able to run a complete build from sstate
without rebuilding *anything* using the 13.04-64 sstate tarball. but for
some people it only used the sstate partially. I didn't get a chance to
'debug' what the problem was. but all our files are available in case some
more folks want to play with them.

You can download the archives here:
http://people.linaro.org/~trevor.woerner/LCE2013/

And the instructions to recreate the 'build env' (e.g. checkout the layers)
is described here: https://collaborate.linaro.org/x/NYBm

--047d7b419059fdad5304e1a3a0ce
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Tue, Jul 16, 2013 at 6:28 PM, Paul Eggleton <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@=
linux.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;p=
adding-left:1ex"><div id=3D":k" style=3D"overflow:hidden">I just got around=
 to trying this again, only this time I cloned a new poky<br>


tree in a different path which should replicate your situation and used<br>
SSTATE_MIRRORS to point to the previous sstate-cache. It built completely f=
rom<br>
sstate as it expected. For reference I was testing with the latest dylan<br=
>
branch and core-image-minimal.<br>
<br>
As I said earlier, if you look at the code only the checksum value goes int=
o<br>
the task checksum and not the filename, so the path to the base of the meta=
data<br>
changing cannot influence the task checksum. However, I think I can see how=
 you<br>
would think that the paths changing influenced the checksum, since the data=
<br>
that we put into the siginfo file *does* contain the full path, and thus<br=
>
bitbake-diffsigs will report that as having changed even though that differ=
ence<br>
didn&#39;t change the task checksum. That is a bug and we should fix how we=
 store<br>
paths either in the cache or in the siginfo file, but that fix will have to=
 take<br>
into account different layer paths. I&#39;d suggest a simpler and more reli=
able<br>
approach would be to just get the relative path to os.path.dirname of the<b=
r>
recipe rather than TOPDIR.<br>
<br>
As far as I can tell though that won&#39;t actually fix the issue triggerin=
g<br>
rebuilds in your case. Something else must be changing. It would be<br>
interesting if you could dig into what that might be as I can&#39;t reprodu=
ce the<br>
rebuilding issue here.</div></blockquote></div><br>on a related topic, we h=
ave given a &#39;hands on workshop&#39; last week at our Linaro Conference.=
 in order to avoid potential network issues and wasting too much time build=
ing, we had prepared &#39;tarballs&#39; for 1) download folder, 2) sstate</=
div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">For sstate =
we have prepared a couple of such archive for OpenSuse and Ubuntu (12.04, 1=
3.04) for both 32-bit and 64-bit variants.</div><div class=3D"gmail_extra">=
<br>

</div><div class=3D"gmail_extra">We used &#39;dylan&#39; in our workshop si=
nce the archives were created a couple of days before, to avoid new commits=
 in master.=A0</div><div class=3D"gmail_extra"><br></div><div class=3D"gmai=
l_extra">

Interesting remarks:=A0</div><div class=3D"gmail_extra">=A0- &#39;download&=
#39; archive worked nicely for everyone</div><div class=3D"gmail_extra">=A0=
- &#39;sstate&#39; archive worked for some people, but not everyone. =A0</d=
iv><div class=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">In my particular case I was able to ru=
n a complete build from sstate without rebuilding *anything* using the 13.0=
4-64 sstate tarball. but for some people it only used the sstate partially.=
 I didn&#39;t get a chance to &#39;debug&#39; what the problem was. but all=
 our files are available in case some more folks want to play with them.</d=
iv>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">You can dow=
nload the archives here:=A0<a href=3D"http://people.linaro.org/~trevor.woer=
ner/LCE2013/">http://people.linaro.org/~trevor.woerner/LCE2013/</a></div><d=
iv class=3D"gmail_extra">

<br></div><div class=3D"gmail_extra">And the instructions to recreate the &=
#39;build env&#39; (e.g. checkout the layers) is described here:=A0<a href=
=3D"https://collaborate.linaro.org/x/NYBm">https://collaborate.linaro.org/x=
/NYBm</a>=A0</div>

<div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><br></div><=
div class=3D"gmail_extra"><br></div></div>

--047d7b419059fdad5304e1a3a0ce--
