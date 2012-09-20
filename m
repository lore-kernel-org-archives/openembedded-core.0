Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1TEd5K-0005jX-81
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Sep 2012 11:30:14 +0200
Received: by iaky10 with SMTP id y10so1483223iak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Sep 2012 02:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=KMgXiPtXiRVYFJEtRbimc0jehilibnC7tszZ+in3b/Y=;
	b=THH5QyQtgllfwFW5NlEVROio2KUmJwIbcG0Ujrptqz9++28RaJKelrBBXDculsg0ET
	riVnAwdJZ9UidzH67cpVmaJmiUrJ23BtyjQ4sy6MjUNFPjOTq3Z6vuSrVV6i2a26hnHi
	e9Ecyn3zaD9t4fpqpxdcze8zhhae+HlFoQYKAzkwmW1wr7wkMvvj28pwUTenSNCU7Nht
	rWFSQz2H8i9FnT1W3K2l5I9Ijj9+nHt2/nd6s3g6Ci993uui3oMP+rlYANjkSVN9yYox
	CTikwBAkyvKFQHhozK46jupc5BBFJ9PPc6HeKq0eGWt+fZQ2lQN0gQxKMy9wJF5JbXGF
	kd+Q==
Received: by 10.50.159.201 with SMTP id xe9mr1039794igb.63.1348132651360; Thu,
	20 Sep 2012 02:17:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.52.8 with HTTP; Thu, 20 Sep 2012 02:17:11 -0700 (PDT)
X-Originating-IP: [89.121.200.106]
In-Reply-To: <1901405.KksRQfqGgP@helios>
References: <1348130679-31552-1-git-send-email-andrei@gherzan.ro>
	<1901405.KksRQfqGgP@helios>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Thu, 20 Sep 2012 12:17:11 +0300
Message-ID: <CAK18fxFZajF2w_KdWtdX-WK4wmet399_ZOcr697XPmF8Fm7QBA@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnK3wTZTwvSXcq9wd8INIQ906P7BCRfSAH/6+QExG7QM8/V5pvqd7uWuS9ueLNMhoc3EgeT
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Replace "echo -e" with "printf" to have the same behavior in dash or bash
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
X-List-Received-Date: Thu, 20 Sep 2012 09:30:14 -0000
Content-Type: multipart/alternative; boundary=14dae93405b3cb600b04ca1e9718

--14dae93405b3cb600b04ca1e9718
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Sep 20, 2012 at 12:13 PM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> On Thursday 20 September 2012 11:44:39 Andrei Gherzan wrote:
> > oe-core removed the prerequisite to have sh as bash. POSIX doesn't define
> > any options and furthermore allows echo -e to be the default behavior.
> > This means that in dash "echo -e" will actually print "-e" and interpret
> > backslashes by default. We use instead "printf" builtin command with or
> > without "\n" to simulate echo -e or echo -n.
>
> I haven't looked over the whole patch, but I did notice a couple of issues
> -
> printf does not behave exactly like echo in a couple of situations:
>
>  (a) if you supply no arguments printf will return an error whereas echo
> does
> not, this will probably break situations where you have changed the script
> to
> do 'printf > /some/file'. Since these statements are usually intended to
> create
> or truncate the specified file, I wonder if we should just change these to
> do '>
> /some/file' instead which works for dash and bash (and doesn't otherwise
> appear
> to be a bashism).
>
>
Already fixed. Patch was on the way.


>  (b) 'printf "\n"' will print just one newline, whereas echo -e "\n" prints
> two. Not sure if this is significant but I think we would rather keep the
> behaviour the same.
>
>
I didn't notice this but you are right. Just tested... I will add this as
well. Thank you.

ag

--14dae93405b3cb600b04ca1e9718
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Thu, Sep 20, 2012 at 12:13 PM, Paul Eggleton =
<span dir=3D"ltr">&lt;<a href=3D"mailto:paul.eggleton@linux.intel.com" targ=
et=3D"_blank">paul.eggleton@linux.intel.com</a>&gt;</span> wrote:<br><block=
quote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc=
 solid;padding-left:1ex">

On Thursday 20 September 2012 11:44:39 Andrei Gherzan wrote:<br>
&gt; oe-core removed the prerequisite to have sh as bash. POSIX doesn&#39;t=
 define<br>
&gt; any options and furthermore allows echo -e to be the default behavior.=
<br>
&gt; This means that in dash &quot;echo -e&quot; will actually print &quot;=
-e&quot; and interpret<br>
&gt; backslashes by default. We use instead &quot;printf&quot; builtin comm=
and with or<br>
&gt; without &quot;\n&quot; to simulate echo -e or echo -n.<br>
<br>
I haven&#39;t looked over the whole patch, but I did notice a couple of iss=
ues -<br>
printf does not behave exactly like echo in a couple of situations:<br>
<br>
=A0(a) if you supply no arguments printf will return an error whereas echo =
does<br>
not, this will probably break situations where you have changed the script =
to<br>
do &#39;printf &gt; /some/file&#39;. Since these statements are usually int=
ended to create<br>
or truncate the specified file, I wonder if we should just change these to =
do &#39;&gt;<br>
/some/file&#39; instead which works for dash and bash (and doesn&#39;t othe=
rwise appear<br>
to be a bashism).<br>
<br></blockquote><div><br></div><div>Already fixed. Patch was on the way.=
=A0</div><div>=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=A0(b) &#39;printf &quot;\n&quot;&#39; will print just one newline, whereas=
 echo -e &quot;\n&quot; prints<br>
two. Not sure if this is significant but I think we would rather keep the<b=
r>
behaviour the same.<br><br></blockquote><div><br></div><div>I didn&#39;t no=
tice this but you are right. Just tested... I will add this as well. Thank =
you.</div><div><br></div><div>ag</div></div>

--14dae93405b3cb600b04ca1e9718--
