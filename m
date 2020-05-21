Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3338.1590090756422936916
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 May 2020 12:52:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: randy.macleod@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 04LJqYHd003780
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 May 2020 12:52:35 -0700 (PDT)
Received: from [172.25.44.3] (172.25.44.3) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 21 May
 2020 12:52:34 -0700
Subject: Re: [oe-core][PATCH 1/1] terminal.py: do not stop searching for auto
To: Joe Slater <joe.slater@windriver.com>,
        <openembedded-core@lists.openembedded.org>
References: <20200521184107.103889-1-joe.slater@windriver.com>
From: "Randy MacLeod" <randy.macleod@windriver.com>
Message-ID: <b10310e2-e33e-eef9-d070-a3bbab96a8a1@windriver.com>
Date: Thu, 21 May 2020 15:52:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200521184107.103889-1-joe.slater@windriver.com>
X-Originating-IP: [172.25.44.3]
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 7bit

On 2020-05-21 2:41 p.m., Joe Slater wrote:
> If a terminal fails to spawn() we should continue looking.
> gnome-terminal, in particular can be present but not start.


Do you mean that it doesn't start on the first try but that
it may / usually does start on subsequent tries?

Since the user has set the  preferred terminal,
this change could confuse them and therefore seems wrong.
If we know of flaky terminal implementations, why not look
for specific versions, issue a warning and either retry
or tell the user to try again? In a few years, we can discard
the code when the flaky terminal version is no longer used.

Is there a bug open with gnome-terminal to track this?
What distro/gnome-terminal do you see this problem in?


> 
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta/lib/oe/terminal.py | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/lib/oe/terminal.py b/meta/lib/oe/terminal.py
> index a1daa2bed6..eb10a6e33e 100644
> --- a/meta/lib/oe/terminal.py
> +++ b/meta/lib/oe/terminal.py
> @@ -207,7 +207,10 @@ def spawn_preferred(sh_cmd, title=None, env=None, d=None):
>               spawn(terminal.name, sh_cmd, title, env, d)
>               break
>           except UnsupportedTerminal:
> -            continue
> +            pass
> +        except:
> +            bb.warn("Terminal %s is supported but did not start" % (terminal.name))
> +    # when we've run out of options
>       else:
>           raise NoSupportedTerminals(get_cmd_list())
>   
> 

The full function is:

def spawn_preferred(sh_cmd, title=None, env=None, d=None):
     """Spawn the first supported terminal, by priority"""
     for terminal in prioritized():
         try:
             spawn(terminal.name, sh_cmd, title, env, d)
             break
         except UnsupportedTerminal:
             continue
     else:
         raise NoSupportedTerminals(get_cmd_list())


so you'll need to change the doc string if you want to retry 3 times.


-- 
# Randy MacLeod
# Wind River Linux
