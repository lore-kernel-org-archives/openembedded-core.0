Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f43.google.com (mail-it0-f43.google.com
	[209.85.214.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8E64D771C5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:31:05 +0000 (UTC)
Received: by mail-it0-f43.google.com with SMTP id j124so93524406ith.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 13:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Q1XToIN6AVaiKfKlAIKWWmRB9ag0yl2Gkp1T8AFgibg=;
	b=L5ciPKlLXIcgBdLMg4X8q73c8S4v5g+c5TWiayFIXajbF5BO2d4lAeQz0ib5yjG3+G
	XcUJGpWUHLMHOG6HdsecmtDARCpLiWTGUYAuvCZ6//v1HL92hEYmoXLigJXMzrVLwRiL
	7NJFua4MdJ0aXBUFqhq1vWgAUQbJhOfXQ3K8BiQGNL2gN2T7D+nkMjVPXtJJuj7JU/9Q
	RjKbZgQltb1fxCZq5kslQtSnvqM11CJsHahDCumrQhvsxMeb4pbfVqvDwL41lltpzrDq
	A6kKdnbuFT0mN+blUS2nBVV8Rf7S9TisBa9vFQBl11N2cmBZrYGh0LOgs9WfTS0avvem
	QUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q1XToIN6AVaiKfKlAIKWWmRB9ag0yl2Gkp1T8AFgibg=;
	b=Wd8TrQI81tP61IiOLsCzEkx+3JOzdiltZzaatTJuPkzaJmuUJ4BZ6bqfbL8PlsqHeh
	6pND7Vs41sRvo4V30mwoF0YFyQuitecivEtdmAAmBSG6iOaTtrlH9PiPsoBhlU9uqvVY
	NDJk2839s8g/x9CRz3K9Ox2MrqC82kwoUkde6suHK6b9veaiATDBtymRnrqTcdJbOzG9
	/aqb5430UUGxPHfFXVnzBga8DSBFQbp30geRGd7CWyQdorN/KM5WZNShQ91Wn/F5/gnL
	RoUlXW3/ckuBu0/ov8OWrgm73efeaAlStpMHV+7gS9ybrArIKXGoOptxcTD74IsV9Xbq
	5jnA==
X-Gm-Message-State: AEkoouuoydwdaZszSugaUHv4Z1ZpebfEuvqhZ6ttAoA2ojEHabzdqIozfyUlAP170Q19YwhwXz9JjZgLLYCynM90
X-Received: by 10.36.19.75 with SMTP id 72mr19876676itz.83.1470688266101; Mon,
	08 Aug 2016 13:31:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 13:30:45 -0700 (PDT)
In-Reply-To: <lyzion6tuh.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <lyzion6tuh.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 21:30:45 +0100
Message-ID: <CAJTo0LbAe5Rj1rE901=d-N45bygePnvvm50JVCJjHCWffU9gCg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: python3: use LC_CTYPE, not LC_ALL to set utf-8
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
X-List-Received-Date: Mon, 08 Aug 2016 20:31:06 -0000
Content-Type: multipart/alternative; boundary=001a1145180aad447d0539954b61

--001a1145180aad447d0539954b61
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 18:41, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
wrote:

> due to python3's misdesigned string handling, recent bitbake/OE enforces
> 'LC_ALL=en_US.utf-8'.  This causes a lot of problems:
>

I can confirm that this combination solves the file encoding problem:

$ export LANG=C
$ python3 -c 'import sys; print(sys.getfilesystemencoding())'
ascii
$ export LC_CTYPE=en_US.UTF-8
$ python3 -c 'import sys; print(sys.getfilesystemencoding())'
utf-8

Ross

--001a1145180aad447d0539954b61
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 18:41, Enrico Scholz <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:enrico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigm=
a-chemnitz.de</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><div id=3D":1nr" cl=
ass=3D"">due to python3&#39;s misdesigned string handling, recent bitbake/O=
E enforces<br>
&#39;LC_ALL=3Den_US.utf-8&#39;.=C2=A0 This causes a lot of problems:</div><=
/blockquote></div><br>I can confirm that this combination solves the file e=
ncoding problem:</div><div class=3D"gmail_extra"><br></div><div class=3D"gm=
ail_extra"><div class=3D"gmail_extra">$ export LANG=3DC<br></div><div class=
=3D"gmail_extra">$ python3 -c &#39;import sys; print(sys.getfilesystemencod=
ing())&#39;</div><div class=3D"gmail_extra">ascii</div></div><div class=3D"=
gmail_extra"><div class=3D"gmail_extra">$ export LC_CTYPE=3Den_US.UTF-8</di=
v><div class=3D"gmail_extra">$ python3 -c &#39;import sys; print(sys.getfil=
esystemencoding())&#39;<br></div><div class=3D"gmail_extra">utf-8</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
></div>

--001a1145180aad447d0539954b61--
