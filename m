Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f41.google.com (mail-oa0-f41.google.com
	[209.85.219.41])
	by mail.openembedded.org (Postfix) with ESMTP id D346070393
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 15:10:35 +0000 (UTC)
Received: by mail-oa0-f41.google.com with SMTP id j17so1580872oag.28
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=vZKLsbryHrfpkf9JCKSuHfOb8lQ11T5VaIxPQy6TvqI=;
	b=cOZKHuGcRwNVRmFqSgAfU/QZDraaj8SVS9HwFQZbxg01uonWO5nfkP2YTRYNDcfWJQ
	YsErOlqrJ5ewEGTahJqp/n9CRrdfXWtVkyYtD5o4vVLMhGGpFpzI3DDt9Kh9BOg81+nZ
	BKE7vgCCf17KGdQQj9WkbJvZRC0jsthP1D0yTx5nEJ14XJF4G/v5aBO1NwmX4T7n/vaS
	uTS/2e4zmlbW/FMpQ8Y7D7ZqMsvtfVyrvQ+lkrL8QnzfDZXOuPHiyA+MMsAKrZ3g2v0G
	jaGba3PDRcSyE8qqWfk3htzWOOE2rtmAMGhRzlevN3NLgQI1XS6ML1bq5NUTKtnKDXRS
	DzhQ==
MIME-Version: 1.0
X-Received: by 10.60.157.131 with SMTP id wm3mr5253104oeb.8.1405350636716;
	Mon, 14 Jul 2014 08:10:36 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Mon, 14 Jul 2014 08:10:36 -0700 (PDT)
In-Reply-To: <53C1362F.9040006@gmail.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
	<1404266329-13524-3-git-send-email-joaohf@gmail.com>
	<53BC8A76.3010608@linux.intel.com>
	<CAP9ODKpMVXway08KT0R+uyLr6V37ouCa038t_n-LzSOdDQ6h=g@mail.gmail.com>
	<53C1362F.9040006@gmail.com>
Date: Mon, 14 Jul 2014 12:10:36 -0300
X-Google-Sender-Auth: uXehUBBbLBSzCNQhaBPS5W21RfY
Message-ID: <CAP9ODKr2vP-6wZLG+uDOY1sD--P-zJE=voXj9rCv21Ljwr9a_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: =?UTF-8?Q?Jo=C3=A3o_Henrique_Ferreira_de_Freitas?= <joaohf@gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Mon, 14 Jul 2014 15:10:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 12, 2014 at 10:20 AM, Jo=C3=A3o Henrique Ferreira de Freitas
<joaohf@gmail.com> wrote:
>
> Hi Otavio
>
> Em 08-07-2014 22:33, Otavio Salvador escreveu:
>
>> Now talking about the patch itself, Joao, did you try to avoid the extra
>> fork calling echo? Using '-print0' option in find might help.
>
>
> Not until now. But I agree about your concern. So, instead of
>
>
> executable_files=3D$($SUDO_EXEC find $native_sysroot -type f -perm /111 -=
exec
> echo \'{}\' \;)
>
> Its better do:
>
> executable_files=3D$($SUDO_EXEC find $native_sysroot -type f -perm /111
> -printf "'%h/%f' ")
>
> No extra fork was used with -printf "'%h/%f' ".
>
> The argument -print0 is not an option because the output of find command
> will be 'path1 path2 path 3' a concatenation of strings not strings split=
 by
> space and protected with ' '.
>
> Both results are valid. But the second is nicer. What do you think?

Nice.

> When I did this patch I was not thinking to solve all problems about spac=
es
> in filename. However a deep dig is needed to track all points that have t=
his
> issue.

Fully agree but this shouldn't deny this patch to be applied. It is a
step further.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

