Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A7A175551
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Jul 2018 04:32:45 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w624WhZk027830
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 1 Jul 2018 21:32:43 -0700 (PDT)
Received: from [128.224.162.218] (128.224.162.218) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Sun, 1 Jul 2018 21:32:42 -0700
To: Joe Slater <joe.slater@windriver.com>,
	<openembedded-core@lists.openembedded.org>
References: <20180621182217.225893-1-joe.slater@windriver.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <f8690960-a8ec-1bc3-df73-723a609f3658@windriver.com>
Date: Mon, 2 Jul 2018 12:35:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20180621182217.225893-1-joe.slater@windriver.com>
X-Originating-IP: [128.224.162.218]
Subject: Re: [PATCH 1/1] postinst-intercepts: do not execute any variant of delay_to_first_boot
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
X-List-Received-Date: Mon, 02 Jul 2018 04:32:45 -0000
Content-Type: multipart/alternative;
	boundary="------------5A89AA31EE7D1F8DDECAF203"

--------------5A89AA31EE7D1F8DDECAF203
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Richard,

It seems that this patch could fix 
https://autobuilder.yocto.io/builders/nightly-multilib/builds/1117/steps/BuildImages_2/logs/stdio.

Error message from log is like below:

ERROR: core-image-sato-1.0-r0 do_rootfs: The postinstall intercept hook 
'update_pixbuf_cache-lib32' failed


Best Regards,
Chen Qi


On 06/22/2018 02:22 AM, Joe Slater wrote:
> As of commit 2c5c6e3ff we create multilib variants of intercept
> hooks but we did not account for delay_to_first_boot variants.
> This was covered up until commit a335e7867, but will now cause
> an error.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>   meta/lib/oe/package_manager.py | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
> index 20a41d5..9aa5847 100644
> --- a/meta/lib/oe/package_manager.py
> +++ b/meta/lib/oe/package_manager.py
> @@ -382,7 +382,8 @@ class PackageManager(object, metaclass=ABCMeta):
>               if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
>                   continue
>   
> -            if script == "delay_to_first_boot":
> +            # we do not want to run any multilib variant of this
> +            if script.startswith("delay_to_first_boot"):
>                   self._postpone_to_first_boot(script_full)
>                   continue
>   



--------------5A89AA31EE7D1F8DDECAF203
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">Hi Richard,<br>
      <br>
      It seems that this patch could fix
<a class="moz-txt-link-freetext" href="https://autobuilder.yocto.io/builders/nightly-multilib/builds/1117/steps/BuildImages_2/logs/stdio">https://autobuilder.yocto.io/builders/nightly-multilib/builds/1117/steps/BuildImages_2/logs/stdio</a>.<br>
      <br>
      Error message from log is like below:<br>
      <pre><span class="stderr">ERROR: core-image-sato-1.0-r0 do_rootfs: The postinstall intercept hook 'update_pixbuf_cache-lib32' failed</span></pre>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      <br>
      On 06/22/2018 02:22 AM, Joe Slater wrote:<br>
    </div>
    <blockquote
      cite="mid:20180621182217.225893-1-joe.slater@windriver.com"
      type="cite">
      <pre wrap="">As of commit 2c5c6e3ff we create multilib variants of intercept
hooks but we did not account for delay_to_first_boot variants.
This was covered up until commit a335e7867, but will now cause
an error.

Signed-off-by: Joe Slater <a class="moz-txt-link-rfc2396E" href="mailto:joe.slater@windriver.com">&lt;joe.slater@windriver.com&gt;</a>
---
 meta/lib/oe/package_manager.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/package_manager.py b/meta/lib/oe/package_manager.py
index 20a41d5..9aa5847 100644
--- a/meta/lib/oe/package_manager.py
+++ b/meta/lib/oe/package_manager.py
@@ -382,7 +382,8 @@ class PackageManager(object, metaclass=ABCMeta):
             if script == "postinst_intercept" or not os.access(script_full, os.X_OK):
                 continue
 
-            if script == "delay_to_first_boot":
+            # we do not want to run any multilib variant of this
+            if script.startswith("delay_to_first_boot"):
                 self._postpone_to_first_boot(script_full)
                 continue
 
</pre>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5A89AA31EE7D1F8DDECAF203--
