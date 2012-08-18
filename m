Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2XGC-0004sK-5y
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 02:51:28 +0200
Received: by wibhn17 with SMTP id hn17so1901774wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 17:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=HTP7LHHjSAA7j0mbTWmrWn+n1bcPIay3zrND6jbihSU=;
	b=lb97evnsEBxkMovN/YkKkKKWNfwwyfWSfGuLXHlBDkXZ/KXSvyTGded/WWWqwg5kI9
	gyfrFOeSfW/uE4aK3fGHvJEAJjErbjlBufNqdB1kX1uIpgLA8PxYVFALEdxQ0kMOMSwq
	IzgP++t/IypS8lZMUEIGEE6YW2C90p7W6YSdYLgjLd2BqVPNRnqVSfEctIyyVGpNejI8
	ERZMMrmTOxAtBZ4t3UOfWnq6krQXuzyB37pzgIZ/lz+lMPnMY44jVY8Qh9TiPW9T3zsD
	opbBOhInLr4IaiBQ2BbYCYypx41piutMbtCTXjzG2gTgxxpxrQ5RX4BsJkOAKKV0F7UP
	3J8A==
MIME-Version: 1.0
Received: by 10.216.139.15 with SMTP id b15mr3542273wej.169.1345250368888;
	Fri, 17 Aug 2012 17:39:28 -0700 (PDT)
Received: by 10.194.42.197 with HTTP; Fri, 17 Aug 2012 17:39:28 -0700 (PDT)
In-Reply-To: <1345197209.26132.2.camel@ted>
References: <1345049073-27898-1-git-send-email-paul.eggleton@linux.intel.com>
	<1566766.76zJMGCy1b@helios> <1345197209.26132.2.camel@ted>
Date: Fri, 17 Aug 2012 17:39:28 -0700
Message-ID: <CAMKF1sqcL7P-vXyTPvHpgAJPjj5kKQ74iBwJ_6UkUoDtud5D5g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] classes/chrpath: trigger an error if chrpath fails
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 18 Aug 2012 00:51:28 -0000
Content-Type: multipart/alternative; boundary=0016e6d58d925f1de204c77f8207

--0016e6d58d925f1de204c77f8207
Content-Type: text/plain; charset=UTF-8

On Friday, August 17, 2012, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-08-16 at 18:13 +0100, Paul Eggleton wrote:
>> On Wednesday 15 August 2012 17:44:33 Paul Eggleton wrote:
>> > If chrpath failed here we were just silently ignoring it.
>> >
>> > Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>> > ---
>> >  meta/classes/chrpath.bbclass |    4 +++-
>> >  1 file changed, 3 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/meta/classes/chrpath.bbclass
b/meta/classes/chrpath.bbclass
>> > index 10b5ca0..ad61fe0 100644
>> > --- a/meta/classes/chrpath.bbclass
>> > +++ b/meta/classes/chrpath.bbclass
>> > @@ -74,7 +74,9 @@ def process_dir (directory, d):
>> >              if len(new_rpaths):
>> >                  args = ":".join(new_rpaths)
>> >                  #bb.note("Setting rpath for %s to %s" %(fpath, args))
>> > -                sub.call([cmd, '-r', args, fpath])
>> > +                ret = sub.call([cmd, '-r', args, fpath])
>> > +                if ret != 0:
>> > +                    bb.error("chrpath command failed with exit code
%d" %
>> > ret)
>> >
>> >              if perms:
>> >                  os.chmod(fpath, perms)
>>
>> I missed that this does not actually report the output from chrpath when
it
>> fails because the task log is suppressed by virtue of calling bb.error.
I will
>> send a follow-up patch to address this.
>>
>> Incidentally a couple of users are reporting that they are now seeing
failures
>> where the rpath size is reported to be too small to contain the path we
are
>> applying. I haven't seen this myself - is there some way we can increase
the
>> space allowed for storing the path or is there some other issue at work
here?
>> I tried to search for some information on how storage of the rpath works
but
>> did not really find anything conclusive.
>
> Unfortunately we can't increase the size available without relinking the
> binary which isn't feasible at this point. The only way to increase the
> size is to run the build in a "deeper" path so that there is more room
> in the field. I did some calculations when we originally implemented
> this and concluded you'd have to build somewhere like /tmp to have a
> short enough path where this would be a problem.
>
> I thought we'd added a sanity test for it too but it sounds like either
> we didn't or if we did, it isn't functioning properly. Its good that at
> least we're catching the errors now and I'd appreciate more information
> about the failing cases.
>


I think we should just dump chrpath and start using patch elf
Which takes care of dynamically increasing path

> Cheers,
>
> Richard
>
>
>
>

--0016e6d58d925f1de204c77f8207
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, August 17, 2012, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br>&gt; On Thu, 2012-08-16 at 18:13 +0100, Paul Eggleton wrote:<br=
>
&gt;&gt; On Wednesday 15 August 2012 17:44:33 Paul Eggleton wrote:<br>&gt;&=
gt; &gt; If chrpath failed here we were just silently ignoring it.<br>&gt;&=
gt; &gt;<br>&gt;&gt; &gt; Signed-off-by: Paul Eggleton &lt;<a href=3D"mailt=
o:paul.eggleton@linux.intel.com">paul.eggleton@linux.intel.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>&gt;&gt; &gt; =C2=A0meta/classes/chrpath.bbclass | =C2=
=A0 =C2=A04 +++-<br>&gt;&gt; &gt; =C2=A01 file changed, 3 insertions(+), 1 =
deletion(-)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; diff --git a/meta/classes/chr=
path.bbclass b/meta/classes/chrpath.bbclass<br>
&gt;&gt; &gt; index 10b5ca0..ad61fe0 100644<br>&gt;&gt; &gt; --- a/meta/cla=
sses/chrpath.bbclass<br>&gt;&gt; &gt; +++ b/meta/classes/chrpath.bbclass<br=
>&gt;&gt; &gt; @@ -74,7 +74,9 @@ def process_dir (directory, d):<br>&gt;&gt=
; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if len(new_rpaths):<=
br>
&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0args =3D &quot;:&quot;.join(new_rpaths)<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#bb.note(&quot;Setting rpat=
h for %s to %s&quot; %(fpath, args))<br>&gt;&gt; &gt; - =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sub.call([cmd, &#39;-r&#39;, args, fp=
ath])<br>
&gt;&gt; &gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =
=3D sub.call([cmd, &#39;-r&#39;, args, fpath])<br>&gt;&gt; &gt; + =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if ret !=3D 0:<br>&gt;&gt; =
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0bb.error(&quot;chrpath command failed with exit code %d&quot; %<br>
&gt;&gt; &gt; ret)<br>&gt;&gt; &gt;<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0if perms:<br>&gt;&gt; &gt; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0os.chmod(fpath, perms)<br>&gt;&gt;=
<br>&gt;&gt; I missed that this does not actually report the output from ch=
rpath when it<br>
&gt;&gt; fails because the task log is suppressed by virtue of calling bb.e=
rror. I will<br>&gt;&gt; send a follow-up patch to address this.<br>&gt;&gt=
;<br>&gt;&gt; Incidentally a couple of users are reporting that they are no=
w seeing failures<br>
&gt;&gt; where the rpath size is reported to be too small to contain the pa=
th we are<br>&gt;&gt; applying. I haven&#39;t seen this myself - is there s=
ome way we can increase the<br>&gt;&gt; space allowed for storing the path =
or is there some other issue at work here?<br>
&gt;&gt; I tried to search for some information on how storage of the rpath=
 works but<br>&gt;&gt; did not really find anything conclusive.<br>&gt;<br>=
&gt; Unfortunately we can&#39;t increase the size available without relinki=
ng the<br>
&gt; binary which isn&#39;t feasible at this point. The only way to increas=
e the<br>&gt; size is to run the build in a &quot;deeper&quot; path so that=
 there is more room<br>&gt; in the field. I did some calculations when we o=
riginally implemented<br>
&gt; this and concluded you&#39;d have to build somewhere like /tmp to have=
 a<br>&gt; short enough path where this would be a problem.<br>&gt;<br>&gt;=
 I thought we&#39;d added a sanity test for it too but it sounds like eithe=
r<br>
&gt; we didn&#39;t or if we did, it isn&#39;t functioning properly. Its goo=
d that at<br>&gt; least we&#39;re catching the errors now and I&#39;d appre=
ciate more information<br>&gt; about the failing cases.<br>&gt;<br><br>
<br>I think we should just dump chrpath and start using patch elf<br>Which =
takes care of dynamically increasing path <br><br>&gt; Cheers,<br>&gt;<br>&=
gt; Richard<br>&gt;<br>&gt;<br>&gt;<br>&gt;

--0016e6d58d925f1de204c77f8207--
