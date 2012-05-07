Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRXwA-00012i-6M
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 02:05:54 +0200
Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 07 May 2012 16:56:01 -0700
Received: by pbbro8 with SMTP id ro8so24477491pbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 May 2012 16:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=SvbOwVcS5880nE+LaXQSO25StGD1AKlixfAICuaEFwg=;
	b=Xt75Kpd+DIehNojJcmJVHx/9gPUpujLbYz4LrBzm+ArMQbXcj0Jzbnt79DNYhhEdQU
	ifpCy4aS87iZX7RRaAOPDnA0OavcN+NBxgVHLdtPnA5Ut7cNWGKlRYiEzHhyLUtwiEBW
	vcXnpOTYhLxpS/JxB78gyWaZWeG7z8jjIerUMUjaaf3V+GWGZY8IYjxTRo0C2fIeiqDc
	wn0BOFFMiaP17WlLECvQHjLWHYH/jVUq48U1kdz62kikyu/AQDmWSNEDzEyfEJqlC9HN
	OU7rMqfJUkX13cqLtZvL5vsCXO0Lic52Fe6N3luDc69J+6l2uNz1IDHnJWKiPtWnB+c3
	JtSw==
Received: by 10.68.234.197 with SMTP id ug5mr1416736pbc.163.1336434960900;
	Mon, 07 May 2012 16:56:00 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id wi8sm334727pbc.11.2012.05.07.16.55.58
	(version=SSLv3 cipher=OTHER); Mon, 07 May 2012 16:55:59 -0700 (PDT)
Message-ID: <4FA8611B.8060609@intel.com>
Date: Mon, 07 May 2012 16:56:11 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
In-Reply-To: <1336065154-8513-1-git-send-email-rep.dot.nop@gmail.com>
X-Gm-Message-State: ALoCoQnt0fv8l41MlwJZv5oSRAFD3BtoCVfQ3ObH4wcByIU45LVvYJCAgfbH9eV2Buq2dKSpKsuY
Subject: Re: [PATCH 1/6] runqemu: Use OE_TMPDIR
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
X-List-Received-Date: Tue, 08 May 2012 00:05:54 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/03/2012 10:12 AM, Bernhard Reutner-Fischer wrote:
> The error message erroneously talked about TMPDIR.
> Just use OE_TMPDIR everywhere to make the name of the variable obvious.
>
> Signed-off-by: Bernhard Reutner-Fischer<rep.dot.nop@gmail.com>

Bernhard,

This change wasn't well-tested and has broken the runqemu script for 
both bash and dash. :(

 From what I can tell, the =~ regex operator is a bashism. It's also one 
that helps a lot with the code readability. So now that we're faced with 
re-writing the script to avoid using that operator, I'm having second 
thoughts about whether the runqemu script really needs to be 
shell-agnostic. The alternative of invoking grep or other commands to 
process the name patterns does not appeal to me.

I can understand why we're trying to ensure our build system doesn't 
require /bin/sh to be bash, but I think support scripts like runqemu 
might be a special case.

What do other people in the community think of this? The runqemu script 
isn't trivial, and it has to run in a lot of different contexts. Should 
we put the time in to make it shell-agnostic, or allow it to require bash?

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


