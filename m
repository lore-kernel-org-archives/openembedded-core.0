Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f52.google.com (mail-qg0-f52.google.com
	[209.85.192.52])
	by mail.openembedded.org (Postfix) with ESMTP id 14C7377016
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Sep 2015 14:07:10 +0000 (UTC)
Received: by qgx61 with SMTP id 61so16487742qgx.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 Sep 2015 07:07:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=shbQ3T0xYABmVL5XwHM+xjtRKA3J4TOKAbKlnLKF6FY=;
	b=Qa5kE5+DZX5mqP0Qv7H7072y8X2vgtSBI+/F7K6lKZMSJbHl2e7yXqJeRj26WpJ3e2
	Pm6NMvhU23ufkJQ7CNig2/aFc1y9bPP65apm8LSgj9Yz5UFJHn10AjqxccKbB3H03znD
	9bRSsGZb6cuHIjineXI8DZ6c821R46RGYvAviCMa/5WkiPBRY3V/dsgZdWB+eGFR/ZJ2
	M2Vhsu0EPg6zz8gZIP6mKJCHxWSgOWVtYsk9QYJR90kxds9OWPe6CXsEratxyX4lnk5L
	xxo/5bDjDA7JeaZJMDcwhmszQnvfzFXocb2OXwAiq2QSbwnwNd/DtbNMYgliqf0UvoOw
	QDUQ==
X-Gm-Message-State: ALoCoQljqnnrSKgE/oH0oc/Axv+aBD2F3IbaIn6OLF08106hPEiJYTFD8jxRt8il6ZiwnaIbt+MP
X-Received: by 10.140.133.67 with SMTP id 64mr5750986qhf.52.1441375630748;
	Fri, 04 Sep 2015 07:07:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Fri, 4 Sep 2015 07:06:50 -0700 (PDT)
In-Reply-To: <1441364835.3071.9.camel@collabora.co.uk>
References: <cover.1441291646.git.joshua.lock@collabora.co.uk>
	<9f749745e56f33bc00d0e08dd4951840b29a557d.1441291646.git.joshua.lock@collabora.co.uk>
	<1441293176.24871.118.camel@linuxfoundation.org>
	<55E87F08.6020902@windriver.com>
	<1441364835.3071.9.camel@collabora.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 4 Sep 2015 15:06:50 +0100
Message-ID: <CAJTo0LavWi5JMktv49M9tbk+v8sfCCSC3BsmPvRGKN8wKKF41w@mail.gmail.com>
To: Joshua Lock <joshua.lock@collabora.co.uk>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/9] systemd: remove hard-coded paths in FILES entries
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
X-List-Received-Date: Fri, 04 Sep 2015 14:07:13 -0000
Content-Type: multipart/alternative; boundary=001a1136fdce75df11051eec6aae

--001a1136fdce75df11051eec6aae
Content-Type: text/plain; charset=UTF-8

On 4 September 2015 at 12:07, Joshua Lock <joshua.lock@collabora.co.uk>
wrote:

> I've prepared a v2 that changes this to nonarch_base_libdir but
> systemd+multilib appears to be broken, see:
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=8256
>

As far as I understand it (and that's only a bit, I'll delegate to Mark)
this is because the sanity check is verifying that the files that get
overwritten between different subarches are actually identical, but
lib32-connman and connman have service files in /lib/systemd that refer to
binaries that are in $(libdir), which changes, so the files change.
Arguably connman should be using libexecdir and not libdir, but that also
would mean fixing libexecdir not to change (for which I have a patch series
that failed to re-send in this cycle).

I've commented on the bug that the example should be changed to be a
library such as lib32-glib-2.0, which is possibly a more useful real world
situation ("I have a 32-bit pre-compiled binary that needs glib" is more
likely than "I want a 64-bit distro with a 32-bit connman") and should
actually work.

Ross

Ross

--001a1136fdce75df11051eec6aae
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 September 2015 at 12:07, Joshua Lock <span dir=3D"ltr">&lt;<a href=3D"=
mailto:joshua.lock@collabora.co.uk" target=3D"_blank">joshua.lock@collabora=
.co.uk</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":=
3b7" class=3D"a3s" style=3D"overflow:hidden">I&#39;ve prepared a v2 that ch=
anges this to nonarch_base_libdir but<br>
systemd+multilib appears to be broken, see:<br>
<br>
<a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8256" rel=3D=
"noreferrer" target=3D"_blank">https://bugzilla.yoctoproject.org/show_bug.c=
gi?id=3D8256</a></div></blockquote><div><br></div><div>As far as I understa=
nd it (and that&#39;s only a bit, I&#39;ll delegate to Mark) this is becaus=
e the sanity check is verifying that the files that get overwritten between=
 different subarches are actually identical, but lib32-connman and connman =
have service files in /lib/systemd that refer to binaries that are in $(lib=
dir), which changes, so the files change.=C2=A0 Arguably connman should be =
using libexecdir and not libdir, but that also would mean fixing libexecdir=
 not to change (for which I have a patch series that failed to re-send in t=
his cycle).</div><div><br></div><div>I&#39;ve commented on the bug that the=
 example should be changed to be a library such as lib32-glib-2.0, which is=
 possibly a more useful real world situation (&quot;I have a 32-bit pre-com=
piled binary that needs glib&quot; is more likely than &quot;I want a 64-bi=
t distro with a 32-bit connman&quot;) and should actually work.</div><div><=
br></div><div>Ross</div><div><br></div><div>Ross</div></div></div></div>

--001a1136fdce75df11051eec6aae--
