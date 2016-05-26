Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 5645175EE7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 21:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QLB2m8016007; Thu, 26 May 2016 22:11:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id VaRmXrI1rBlE; Thu, 26 May 2016 22:11:02 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4QLAvmG016004
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 26 May 2016 22:10:59 +0100
Message-ID: <1464297057.19134.66.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 22:10:57 +0100
In-Reply-To: <1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
References: <cover.1464168189.git.liezhi.yang@windriver.com>
	<1357d837c72abd1d9552aa77fd63126f7275aa23.1464168189.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/2] utility-tasks.bbclass: fix do_listtasks
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
X-List-Received-Date: Thu, 26 May 2016 21:11:03 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2016-05-25 at 02:23 -0700, Robert Yang wrote:
> It lists deleted tasks which is unexpected, use __BBTASKS to fix the
> problem since deltask() which is defined in bitbake/lib/bb/build.py
> updates __BBTASKS correctly.
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/utility-tasks.bbclass | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/meta/classes/utility-tasks.bbclass
> b/meta/classes/utility-tasks.bbclass
> index 7bc584a..b06d335 100644
> --- a/meta/classes/utility-tasks.bbclass
> +++ b/meta/classes/utility-tasks.bbclass
> @@ -3,14 +3,14 @@ do_listtasks[nostamp] = "1"
>  python do_listtasks() {
>      taskdescs = {}
>      maxlen = 0
> -    for e in d.keys():
> -        if d.getVarFlag(e, 'task', True):
> -            maxlen = max(maxlen, len(e))
> -            if e.endswith('_setscene'):
> -                desc = "%s (setscene version)" % (d.getVarFlag(e[:
> -9], 'doc', True) or '')
> -            else:
> -                desc = d.getVarFlag(e, 'doc', True) or ''
> -            taskdescs[e] = desc
> +    bbtasks = d.getVar('__BBTASKS', True)
> +    for task in bbtasks:
> +        maxlen = max(maxlen, len(task))
> +        if task.endswith('_setscene'):
> +            desc = "%s (setscene version)" % (d.getVarFlag(task[:
> -9], 'doc', True) or '')
> +        else:
> +            desc = d.getVarFlag(task, 'doc', True) or ''
> +        taskdescs[task] = desc
>  
>      tasks = sorted(taskdescs.keys())
>      for taskname in tasks:

__BBTASKS is a bitbake internal variable and OE should not know or care
about it, its implementation may change without warning and I won't
take bug reports about that.

We need to fix this differently.

Cheers,

Richard

