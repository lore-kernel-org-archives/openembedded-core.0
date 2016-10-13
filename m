Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id D2F73719B6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 10:39:42 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id j37so80398724ioo.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2016 03:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qmD1TpRprXhosYdp9ynqKW6N1FX5dmj90M69gXCQ/TU=;
	b=14MyeOW6iQblwW+eXIrSiVaEBAIc2iFDvWkxIRZWE7XEMloYiMcU2Ghvl+3YlueNLX
	Oq59TsXPQP5BQWI5W75xXg/6xMClGQjUvZHCxTdUsxI9y/ONOW26T3e4hbL9R3RwmXEB
	dVwqDJd6zo/I0MQLswv7b5DBNc0gB5vtn7TJq3k92e4p5feOipc8IsANmrjx6sZd5tlT
	5AKppvK3bP4eP/l8AMmuKLYqGcjgBVE+HN3C76K8PUqHoX+63UpsHI1mQdExiyPNCdNV
	8BfHzeFeIz9nLc3JBYyrTzEp/B2HlGnF6DotrmlkorsIyV/DIoeshdXPONHQHhU62vKT
	VMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qmD1TpRprXhosYdp9ynqKW6N1FX5dmj90M69gXCQ/TU=;
	b=eOkbc4U2v57/Zim7S04qiCFZRpMPRYHG2lpBNvLFtfmtNZ77njs6guFIcE4GgeugRK
	xNWUBzYKfHUlDpHgOPpoKlMxZUJgp6rfeQPpzc/E8lfR7UcOrLwaMIdfTPX2k9LDAmx9
	Oxn6OeCIL+/c4d/Eq4EQmcu/13shJE4ZCL8TN0Pdkfyv+nlJwWsX4t+U0yL7AAh6zZnI
	gIo/jPRVDAQ2HiwuWgx/a0LNd81rAtq/AZ2NkgVPzbO4S6npsUdPFpMBb50GFA7JZ6ip
	UCNJqajwWsqIqUfsM/atV/ORKOOhLbLvPXwHMck6S6xepkR47D04BUErUU7v/Ao4uyVN
	O6ig==
X-Gm-Message-State: AA6/9RkGri6W0woagKL2G8+gJgdoFyANRmeeSQBo3hdm6i2EuX6OmytLuMVUM5RZ4siUjK0y5qPn+qaj1Y2YxGfT
X-Received: by 10.107.5.72 with SMTP id 69mr5730922iof.132.1476355183961; Thu,
	13 Oct 2016 03:39:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.155.66 with HTTP; Thu, 13 Oct 2016 03:39:23 -0700 (PDT)
In-Reply-To: <5efcefb8fb966ad7c7a21a6c217db43199dd7b46.1476351914.git.liezhi.yang@windriver.com>
References: <cover.1476351914.git.liezhi.yang@windriver.com>
	<5efcefb8fb966ad7c7a21a6c217db43199dd7b46.1476351914.git.liezhi.yang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 13 Oct 2016 11:39:23 +0100
Message-ID: <CAJTo0Lbruk380HCw_c_m5VR+RwT53XWSYGHSULhKH8ar3gQWVA@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] package_manager.py: fix for "Argument list too long"
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
X-List-Received-Date: Thu, 13 Oct 2016 10:39:43 -0000
Content-Type: multipart/alternative; boundary=001a113efe2c4d7b97053ebcba60

--001a113efe2c4d7b97053ebcba60
Content-Type: text/plain; charset=UTF-8

On 13 October 2016 at 10:45, Robert Yang <liezhi.yang@windriver.com> wrote:

> This is because "copyhardlinktree(deploy_arch_dir, arch_channel)" does:
> "cp -afl deploy_arch_dir/* arch_channel", while the deploy_arch_dir/* is
> expanded to "deploy_arch_dir/pkg1 deploy_arch_dir/pkg2
> deploy_arch_dir/pkg3 ..." which causes the "Argument list too long",
> change cwd to deploy_arch_dir can avoid the error.
>

Would it be better to change the implementation of copyhardlinktree so that
it *can't* have this problem?

Ross

--001a113efe2c4d7b97053ebcba60
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 October 2016 at 10:45, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":5iq" =
class=3D"a3s aXjCH m157bd7460cccb1df">This is because &quot;copyhardlinktre=
e(deploy_arch_<wbr>dir, arch_channel)&quot; does:<br>
&quot;cp -afl deploy_arch_dir/* arch_channel&quot;, while the deploy_arch_d=
ir/* is<br>
expanded to &quot;deploy_arch_dir/pkg1 deploy_arch_dir/pkg2<br>
deploy_arch_dir/pkg3 ...&quot; which causes the &quot;Argument list too lon=
g&quot;,<br>
change cwd to deploy_arch_dir can avoid the error.<br></div></blockquote></=
div><br>Would it be better to change the implementation of copyhardlinktree=
 so that it *can&#39;t* have this problem?</div><div class=3D"gmail_extra">=
<br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113efe2c4d7b97053ebcba60--
