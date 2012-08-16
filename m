Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T1nvC-0004jA-HH
	for openembedded-core@openembedded.org; Thu, 16 Aug 2012 02:26:46 +0200
Received: by yenm1 with SMTP id m1so2604918yen.6
	for <openembedded-core@openembedded.org>;
	Wed, 15 Aug 2012 17:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=rjWSrvtVNgWhqlh/PDAau9EqxDfCmez5iB8pA+wAfTY=;
	b=eCMBDtMyTqX1GIAegmlr0UIpqx89yFGBxK5W6EtNKHjPrtaaePwQ9rEAkjUpjxA3N4
	kvWhVv71osEUsWu8mZAy5SGJAHMNjVfhVekARe7cHuJvP2/ZpsqhW/Pp4EYlLT1e9kI4
	i71mKKmU7485ghmh1Fx3TRPlTx1AuOQkMet4uaMw9fgdc7F1GMZaBMxgBAYyXqyf2lMc
	J9gVAzJ7w8FOaKZw57DTzNQL8U6t5QTIN/fsQjsWJEpsa7jsa3BzUYD9tSxLnkvx3QAx
	zfZHJol+46rKqjp67xqnkKJ1hRfEtRBuoLGQ8Fk/XQVv/kSizBLoUb54FtoMVSD9p9Ub
	yLIw==
Received: by 10.50.100.137 with SMTP id ey9mr256598igb.61.1345076089343; Wed,
	15 Aug 2012 17:14:49 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.50.191.196 with HTTP; Wed, 15 Aug 2012 17:14:29 -0700 (PDT)
In-Reply-To: <1345070782-4518-2-git-send-email-andy.ross@windriver.com>
References: <1345070782-4518-1-git-send-email-andy.ross@windriver.com>
	<1345070782-4518-2-git-send-email-andy.ross@windriver.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 15 Aug 2012 17:14:29 -0700
X-Google-Sender-Auth: jvA1ZJrRb7uMsyh-U5mwmYGliNw
Message-ID: <CABcZANnFML0a-qAZA33skkJK+=9sTN_bG=KWsGbLYfXZgqDbnQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core@openembedded.org
Subject: Re: [PATCH] insane.bbclass: Fix RPATH warning in the face of funny path strings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Aug 2012 00:26:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 15, 2012 at 3:46 PM, Andy Ross <andy.ross@windriver.com> wrote:
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 556a176..ade0616 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -161,6 +161,17 @@ def package_qa_check_rpath(file,name, d, elf, messages):
>              if dir in line:
>                  messages.append("package %s contains bad RPATH %s in file %s" % (name, line, file))
>
> +def rpath_norm(s):
> +    import re
> +    s = re.sub('[^/]+/\.\.(/|$)', '/', s) # snip ".." components
> +    s = re.sub('/\.(/|$)', '/', s)        # snip "." components
> +    s = re.sub('/+', '/', s)              # snip repeated slashes
> +    s = re.sub('/
> , '', s)               # snip trailing slash
> +    return s
> +
> +def rpath_eq(a, b):
> +    return rpath_norm(a) == rpath_norm(b)
> +

Please just use os.path.normpath() rather than reinventing the wheel here.
-- 
Christopher Larson


