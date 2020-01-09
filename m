Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 07F277FE34
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 02:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 009242xu027329
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jan 2020 18:04:18 -0800
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Wed, 8 Jan 2020 18:03:56 -0800
To: <yanfei.xu@windriver.com>, <openembedded-core@lists.openembedded.org>
References: <1578468806-411330-1-git-send-email-yanfei.xu@windriver.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <79a30893-4237-0092-07cf-b98861abafd2@windriver.com>
Date: Wed, 8 Jan 2020 21:03:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1578468806-411330-1-git-send-email-yanfei.xu@windriver.com>
X-Originating-IP: [172.25.44.8]
Subject: Re: [PATCH] sysklogd: add a delay before klogd connect syslogd
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
X-List-Received-Date: Thu, 09 Jan 2020 02:04:28 -0000
Content-Type: multipart/alternative;
	boundary="------------9DE68BA00C45C15DF959F01E"
Content-Language: en-CA

--------------9DE68BA00C45C15DF959F01E
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 1/8/20 2:33 AM, yanfei.xu@windriver.com wrote:
> From: Yanfei Xu <yanfei.xu@windriver.com>
>
> klogd and syslogd's type has been changed from "forking" to "simple"
> in service file used by systemd. It causes klogd will boot on the
> heels of syslogd in a very short time and result in a empty kern.log.
>
> Adding a delay before klogd connecting syslogd can solve this.
> --------------------------
> steps to reproduce:
>      Bitbake core-image-minimal  with configuration as follow：
>      MACHINE ??= "genericx86-64"
>      DISTRO_FEATURES_append = " systemd"
>      VIRTUAL-RUNTIME_init_manager = "systemd"
>      VIRTUAL-RUNTIME_base-utils-syslog = "sysklogd"
>
> After your system booting successfully, you will find /var/log/kern.log
> is empty.
> -------------------------
>
> Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ---
>   meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
> index 774d23b..ff8188d 100644
> --- a/meta/recipes-extended/sysklogd/sysklogd.inc
> +++ b/meta/recipes-extended/sysklogd/sysklogd.inc
> @@ -21,7 +21,7 @@ SRC_URI = "git://github.com/troglobit/sysklogd.git;nobranch=1 \
>              "
>   S = "${WORKDIR}/git"
>   
> -EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --without-logger"
> +EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --with-klogd-delay=1 --without-logger"
>   
>   do_install_append () {
>          install -d ${D}${sysconfdir}

This might be a sensible work-around for the 3.0/zeus releaese but
for the master branch it is not acceptable.

A delay is often a work-around especially if it's a round number like 1 
second.
A slower machine may not be fixed by a 2 second delay and so we'd be
tempted to delay 2 or 10 seconds, soon enough your system is only fully
initialized after a fortnight. ;-)

Also and more importantly we should be looking at what upstream is doing and
for sysklogd, they are _removing_ klogd:

https://github.com/troglobit/sysklogd/commits/6bb6672ebf797078d1c31c83dcf960f767808557

     Remove klogd from the sysklogd project

	This patch removes one of the traditionally key pieces of the sysklogd
	project, klogd.  Now that syslogd performs logging of kernel messages
	we no longer require a separate daemon for that.

	Signed-off-by: Joachim Nilsson <troglobit@gmail.com>


The question to answer is, do all the syslog daemons:
  - syslogd
  - rsyslogd
  - systemd/journald
  - others?
have the support that we klogd provides.
-- 
# Randy MacLeod
# Wind River Linux


--------------9DE68BA00C45C15DF959F01E
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 1/8/20 2:33 AM,
      <a class="moz-txt-link-abbreviated" href="mailto:yanfei.xu@windriver.com">yanfei.xu@windriver.com</a> wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1578468806-411330-1-git-send-email-yanfei.xu@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Yanfei Xu <a class="moz-txt-link-rfc2396E" href="mailto:yanfei.xu@windriver.com">&lt;yanfei.xu@windriver.com&gt;</a>

klogd and syslogd's type has been changed from "forking" to "simple"
in service file used by systemd. It causes klogd will boot on the
heels of syslogd in a very short time and result in a empty kern.log.

Adding a delay before klogd connecting syslogd can solve this.
--------------------------
steps to reproduce:
    Bitbake core-image-minimal  with configuration as follow：
    MACHINE ??= "genericx86-64"
    DISTRO_FEATURES_append = " systemd"
    VIRTUAL-RUNTIME_init_manager = "systemd"
    VIRTUAL-RUNTIME_base-utils-syslog = "sysklogd"

After your system booting successfully, you will find /var/log/kern.log
is empty.
-------------------------

Signed-off-by: Yanfei Xu <a class="moz-txt-link-rfc2396E" href="mailto:yanfei.xu@windriver.com">&lt;yanfei.xu@windriver.com&gt;</a>
---
 meta/recipes-extended/sysklogd/sysklogd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/sysklogd/sysklogd.inc b/meta/recipes-extended/sysklogd/sysklogd.inc
index 774d23b..ff8188d 100644
--- a/meta/recipes-extended/sysklogd/sysklogd.inc
+++ b/meta/recipes-extended/sysklogd/sysklogd.inc
@@ -21,7 +21,7 @@ SRC_URI = <a class="moz-txt-link-rfc2396E" href="git://github.com/troglobit/sysklogd.git;nobranch=1\">"git://github.com/troglobit/sysklogd.git;nobranch=1 \
            "</a>
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --without-logger"
+EXTRA_OECONF = "--with-systemd=${systemd_system_unitdir} --with-klogd --with-klogd-delay=1 --without-logger"
 
 do_install_append () {
        install -d ${D}${sysconfdir}
</pre>
    </blockquote>
    <p>This might be a sensible work-around for the 3.0/zeus releaese
      but<br>
      for the master branch it is not acceptable.</p>
    <p>A delay is often a work-around especially if it's a round number
      like 1 second.<br>
      A slower machine may not be fixed by a 2 second delay and so we'd
      be <br>
      tempted to delay 2 or 10 seconds, soon enough your system is only
      fully<br>
      initialized after a fortnight. ;-)<br>
    </p>
    <p>Also and more importantly we should be looking at what upstream
      is doing and<br>
      for sysklogd, they are _removing_ klogd:</p>
    <p><a class="moz-txt-link-freetext" href="https://github.com/troglobit/sysklogd/commits/6bb6672ebf797078d1c31c83dcf960f767808557">https://github.com/troglobit/sysklogd/commits/6bb6672ebf797078d1c31c83dcf960f767808557</a></p>
        Remove klogd from the sysklogd project
    <div class="commit-desc">
      <pre class="moz-signature" cols="72">	This patch removes one of the traditionally key pieces of the sysklogd
	project, klogd.  Now that syslogd performs logging of kernel messages
	we no longer require a separate daemon for that.

	Signed-off-by: Joachim Nilsson <a class="moz-txt-link-rfc2396E" href="mailto:troglobit@gmail.com">&lt;troglobit@gmail.com&gt;</a>


The question to answer is, do all the syslog daemons:
 - syslogd
 - rsyslogd
 - systemd/journald
 - others?
have the support that we klogd provides.
-- 
# Randy MacLeod
# Wind River Linux
</pre>
    </div>
  </body>
</html>

--------------9DE68BA00C45C15DF959F01E--
