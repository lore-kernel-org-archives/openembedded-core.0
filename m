Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C86C0771F7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 12 Sep 2016 10:19:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8CAJas0009557; Mon, 12 Sep 2016 11:19:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id kOZ84humzIhL; Mon, 12 Sep 2016 11:19:36 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u8CAJXlj009533
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 12 Sep 2016 11:19:34 +0100
Message-ID: <1473675573.20226.364.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, openembedded-core@lists.openembedded.org
Date: Mon, 12 Sep 2016 11:19:33 +0100
In-Reply-To: <20160911121416.31304-1-net147@gmail.com>
References: <20160911121416.31304-1-net147@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
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
X-List-Received-Date: Mon, 12 Sep 2016 10:19:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Sun, 2016-09-11 at 22:14 +1000, Jonathan Liu wrote:
> This fixes tashhash mismatch errors creating images when IMAGE_CMD
> references a variable whose value is always changing even though the
> variable is specified in IMAGE_CMD vardepsexclude.
> 
> Signed-off-by: Jonathan Liu <net147@gmail.com>
> ---
>  meta/classes/image.bbclass | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> index 8c8b8a2..f85ea86 100644
> --- a/meta/classes/image.bbclass
> +++ b/meta/classes/image.bbclass
> @@ -441,6 +441,10 @@ python () {
>          localdata.delVar('DATETIME')
>          localdata.delVar('TMPDIR')
>  
> +        vardepsexclude = d.getVarFlag('IMAGE_CMD', 'vardepsexclude',
> True) or ''
> +        vardepsexclude += ' ' + (d.getVarFlag('IMAGE_CMD_' + realt,
> 'vardepsexclude', True) or '')
> +        for var in vardepsexclude.split():
> +            localdata.delVar(var)
>          image_cmd = localdata.getVar("IMAGE_CMD", True)
>          vardeps.add('IMAGE_CMD_' + realt)
>          if image_cmd:

I think this is complicating an already fragile situation and it
worries me. Can you be more specific about which variable is causing
problems here?

I'm starting to wonder if we should have an explicit flag set here for
"problem" variables and we'd default to the values "DATETIME TMPDIR"
which are already handled in the code. You'd then just need to extend
that value. Using vardepsexclude seems to partially but not completely
match?

Incidentally, I really want to complete some of the rework in this area
so we get to "proper" functions and can stop playing games like this. I
just haven't had the time to do that and this point in the release
cycle isn't the right time to do that.

Cheers,

Richard



