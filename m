Return-Path: <Zhe.He@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 563656069C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Sep 2016 06:54:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8Q6sBwY022508
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 25 Sep 2016 23:54:11 -0700 (PDT)
Received: from [128.224.162.234] (128.224.162.234) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 25 Sep 2016 23:54:10 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <1474536792-7645-1-git-send-email-zhe.he@windriver.com>
	<CAJTo0LaxDWsNoY6Ds8W6V+Vjtr8H+-HpO24KHH-Ej-5ogrS_MA@mail.gmail.com>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <598d0d2c-443f-c7b3-10ee-bde5256ca76c@windriver.com>
Date: Mon, 26 Sep 2016 14:54:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaxDWsNoY6Ds8W6V+Vjtr8H+-HpO24KHH-Ej-5ogrS_MA@mail.gmail.com>
X-Originating-IP: [128.224.162.234]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] Remove bashisms
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
X-List-Received-Date: Mon, 26 Sep 2016 06:54:13 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

OK. I have senta new patch([OE-core] [PATCH] guile: Remove bashisms) for guile as other bashisms have been addressed.

Thanks,
Zhe

On 09/22/2016 06:04 PM, Burton, Ross wrote:
> On 22 September 2016 at 10:33, <zhe.he@windriver.com <mailto:zhe.he@windriver.com>>wrote:
>
>     -if type systemctl >/dev/null 2>/dev/null; then
>     +if command -p systemctl >/dev/null 2>/dev/null; then
>
>
> This doesn't do what you want:
>
> $ type whoami ; echo $?
> whoami is /usr/bin/whoami
> 0
> $ type foobar; echo $?
> -bash: type: foobar: not found
> 1
>
> 'type' when used with a binary prints the full path (thus the redirect) and returns success if it was found, error if it wasn't.
>
> $ command -p whoami ; echo $?
> ross
> 0
>
> $ which applyotron
> /home/ross/bin/applyotron
> $ command -p applyotron
> -bash: applyotron: command not found
>
> 'command -p' searches for a binary (ignoring any aliases or builtins) in a hardcoded set of paths as you pass -p (not $PATH, so will fail at rootfs time) for a binary and executes it if found.  We don't want to look in a hard-coded set of paths, and we don't want to run the binary, so these changes are bad.
>
> bash, dash and ash all support type, which is why verify-bashisms has them on the whitelist as the simplest way of saying "does this binary exist".
>
>
>             # Remove unpackaged files (based on list in rpm.spec)
>     -       rm -f ${D}/${libdir}/rpm/{Specfile.pm,cpanflute,cpanflute2,rpmdiff,rpmdiff.cgi,sql.prov,sql.req,tcl.req,trpm}
>     +       rm -f ${D}/${libdir}/rpm/Specfile.pm
>     +       rm -f ${D}/${libdir}/rpm/cpanflute
>     +       rm -f ${D}/${libdir}/rpm/cpanflute2
>     +       rm -f ${D}/${libdir}/rpm/rpmdiff
>     +       rm -f ${D}/${libdir}/rpm/rpmdiff.cgi
>     +       rm -f ${D}/${libdir}/rpm/sql.prov
>     +       rm -f ${D}/${libdir}/rpm/sql.req
>     +       rm -f ${D}/${libdir}/rpm/tcl.req
>     +       rm -f ${D}/${libdir}/rpm/trpm
>
>
> I deleted these in "rpm: remove redundant removals" when doing a similar sweep, so please rebase to master.
>
> I think all thats left is the guile cleanup, so can you submit just that with a rewritten commit message.
>
> Ross


