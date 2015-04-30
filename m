Return-Path: <mario.goulart@gmail.com>
Received: from mail-vn0-f49.google.com (mail-vn0-f49.google.com
	[209.85.216.49])
	by mail.openembedded.org (Postfix) with ESMTP id B057165CD0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 13:08:12 +0000 (UTC)
Received: by vnbg7 with SMTP id g7so7066881vnb.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Apr 2015 06:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
	:user-agent:mime-version:content-type;
	bh=VBOGvkOWUv1FBoUAnutLrNkgaVCKF6BI1uJ06flr/NQ=;
	b=p0/4Ems3FLMxm6eTMOxTZL50x68m+xim4SPRaqn+T6Vob+7YTi4omaf/Mx1ynGOSu0
	CQW1rmi8lVSCXqUnkRmhDUKr33GPYYuvM2rs8BbifuU7hB0oXjGjyBCNeKO/3f/w78t1
	+Po8BXkz+um5h7ocN7lPu3zZpGVApgMFlscNvVyNlipH6Dm6hOAjR7PUXDwv+eB31BIS
	0+y3Ba0wKlq2+SDy0+Yw4BRppopLXgFQDi0jdSGlp5mWMhq0sqwkoAoskNigyfQnlozU
	ZBIQnHt5r8S5YH1ribKY1turDK1E+qvIVfwPUlxhrkJnnOGTH96qteVL8JDfiLUGHxAy
	dDfg==
X-Received: by 10.52.75.201 with SMTP id e9mr7452269vdw.33.1430399292948;
	Thu, 30 Apr 2015 06:08:12 -0700 (PDT)
Received: from email.parenteses.org.gmail.com (email.parenteses.org.
	[198.199.72.94])
	by mx.google.com with ESMTPSA id ew5sm3337064vdc.10.2015.04.30.06.08.11
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Apr 2015 06:08:12 -0700 (PDT)
Sender: Mario Domenech Goulart <mario.goulart@gmail.com>
From: Mario Domenech Goulart <mario@ossystems.com.br>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com>
Date: Thu, 30 Apr 2015 13:08:09 +0000
In-Reply-To: <1430391890-6083-1-git-send-email-ed.bartosh@linux.intel.com> (Ed
	Bartosh's message of "Thu, 30 Apr 2015 14:04:50 +0300")
Message-ID: <87egn12286.fsf@email.parenteses.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.4 (gnu/linux)
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] oeqa/utils: Allow ~ in bblayers
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
X-List-Received-Date: Thu, 30 Apr 2015 13:08:12 -0000
Content-Type: text/plain

Hi Ed,

On Thu, 30 Apr 2015 14:04:50 +0300 Ed Bartosh <ed.bartosh@linux.intel.com> wrote:

> Bitbake can parse ~ in bblayer's paths.
> Added this functionality to oeqa code.
>
> Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
> ---
>  meta/lib/oeqa/utils/commands.py | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
> index e8a467f..bc1dbb1 100644
> --- a/meta/lib/oeqa/utils/commands.py
> +++ b/meta/lib/oeqa/utils/commands.py
> @@ -155,6 +155,8 @@ def get_test_layer():
>      layers = get_bb_var("BBLAYERS").split()
>      testlayer = None
>      for l in layers:
> +        if '~' in l:
> +            l = os.path.expanduser(l)

Is the "if '~' in l" test necessary?

AFAIK, applying expanduser to a string that doesn't contain '~' will
just return the string itself.

>          if "/meta-selftest" in l and os.path.isdir(l):
>              testlayer = l
>              break
> -- 
> 2.1.4

Best wishes.
Mario
-- 
http://www.ossystems.com.br

