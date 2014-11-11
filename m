Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 5F7BB65CED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 20:24:29 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id u7so7393344qaz.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Nov 2014 12:24:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MJzE5OC1vg4Goa3M23oA5QXF6L2tpS8pFclSQXR00Ww=;
	b=RSiOMnqD6Ex41+q3DpJDvcDjpq2EtllPcN44EwRR7rUot4Y2P1GoDBrdBnzKj3GNVA
	ycUTyELgWd+X3epqwOLFeBkoq2AsxOPHCOIqWFcwBcV9prqD4CkNU7kqod3lIypHh6AG
	L69vruUOfamiCGXnFktNgdG+ttBaPZzLD1cah/nNsi5b/fZIzbK4YcfkUi6O0Ozzdr/m
	mfAyrNCd4QMYa7/wQ0PbU2KqcmKdX5T0zfXM5Y3AgXcnvikg6MXpL2ag/en/+ABr1mJk
	C24z9iQGkP8nCgZrZ8Nxv08MvhzfowwZnEX58QQUOsjgzXzj6VeXEeMg6HzVflvCtF83
	SOkA==
X-Gm-Message-State: ALoCoQnm5W4/0vQCsOsJCMohGbfgWonA0XpckvfHMDUSD3wOCerQfgWDT1kmjDTNzM2Wf916fB2s
X-Received: by 10.140.94.246 with SMTP id g109mr52753796qge.77.1415737470259; 
	Tue, 11 Nov 2014 12:24:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.98.213 with HTTP; Tue, 11 Nov 2014 12:24:10 -0800 (PST)
In-Reply-To: <CANyK_8evfrjQsTJ7sCKKN-JQwvnYwFOz0qC4B5G13EK6=CzfrQ@mail.gmail.com>
References: <1414751666-21525-1-git-send-email-paul@paulbarker.me.uk>
	<CAJTo0Lbf8q3z+dAZzpOu0Rgt4MVKjiCJ9fePOdZoTuK2Yf6ZyA@mail.gmail.com>
	<CANyK_8fduuFa5=4aoF-3Zjd8zBpRr6ZZCSgj=9nNzKARoKzOeg@mail.gmail.com>
	<CANyK_8evfrjQsTJ7sCKKN-JQwvnYwFOz0qC4B5G13EK6=CzfrQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Nov 2014 20:24:10 +0000
Message-ID: <CAJTo0LaqYjo_z0xkA0dxg4Dd04OEdxmnPUvO-zCERrN8kbPxng@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] opkg: Upgrade to v0.2.3
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
X-List-Received-Date: Tue, 11 Nov 2014 20:24:40 -0000
Content-Type: multipart/alternative; boundary=001a113a81d602aee505079b119a

--001a113a81d602aee505079b119a
Content-Type: text/plain; charset=UTF-8

On 11 November 2014 20:19, Paul Barker <paul@paulbarker.me.uk> wrote:

> I've reproduced this and tracked the cause down to the
> pkg_hash_fetch_best_installation_candidate function mis-handling an
> obscure edge case. There are two providers of perl-module-config
> (libperl5 and perl), but neither is actually called
> 'perl-module-config'. This triggers an "if (nmatching > 1)" branch
> which causes the function to immediately return NULL instead of
> selecting one of the matching packages to return. I kept this when
> refactoring the old code but never understood why it was there in the
> first place. Removing this branch fixes the problem but I need to
> think through what other consequences that change may have.
>
> I'll roll this fix into opkg v0.2.4 which I'm planning to release
> ASAP. Then I'll resubmit a patch against oe-core which upgrades opkg
> to v0.2.4.
>
> In the meantime, the opkg-utils patch should be mergeable on its own.
>

Thanks for the prompt debugging Paul!

Ross

--001a113a81d602aee505079b119a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 November 2014 20:19, Paul Barker <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:paul@paulbarker.me.uk" target=3D"_blank">paul@paulbarker.me.uk</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":26z" class=3D"a=
3s" style=3D"overflow:hidden">I&#39;ve reproduced this and tracked the caus=
e down to the<br>
pkg_hash_fetch_best_installation_candidate function mis-handling an<br>
obscure edge case. There are two providers of perl-module-config<br>
(libperl5 and perl), but neither is actually called<br>
&#39;perl-module-config&#39;. This triggers an &quot;if (nmatching &gt; 1)&=
quot; branch<br>
which causes the function to immediately return NULL instead of<br>
selecting one of the matching packages to return. I kept this when<br>
refactoring the old code but never understood why it was there in the<br>
first place. Removing this branch fixes the problem but I need to<br>
think through what other consequences that change may have.<br>
<br>
I&#39;ll roll this fix into opkg v0.2.4 which I&#39;m planning to release<b=
r>
ASAP. Then I&#39;ll resubmit a patch against oe-core which upgrades opkg<br=
>
to v0.2.4.<br>
<br>
In the meantime, the opkg-utils patch should be mergeable on its own.</div>=
</blockquote></div><br>Thanks for the prompt debugging Paul!</div><div clas=
s=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113a81d602aee505079b119a--
