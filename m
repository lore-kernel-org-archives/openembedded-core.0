Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CA937EC48
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Oct 2019 01:21:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x931LAge016127
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Oct 2019 18:21:10 -0700
Received: from [128.224.20.237] (128.224.20.237) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Wed, 2 Oct 2019 18:21:09 -0700
To: <openembedded-core@lists.openembedded.org>
References: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
From: Trevor Gamblin <trevor.gamblin@windriver.com>
Message-ID: <6f972e13-f455-43fa-ef5f-7cf8e6e9bf84@windriver.com>
Date: Wed, 2 Oct 2019 21:21:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191002182824.38571-1-Trevor.Gamblin@windriver.com>
Subject: Re: [PATCH] watchdog: fix service PIDFile in do_install_append
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
X-List-Received-Date: Thu, 03 Oct 2019 01:21:09 -0000
Content-Type: multipart/alternative;
	boundary="------------A92B3880CE99F64BE14A5DB1"
Content-Language: en-US

--------------A92B3880CE99F64BE14A5DB1
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 10/2/19 2:28 PM, Trevor Gamblin wrote:

> From: Trevor Gamblin <trevor.gamblin@windriver.com>
>
> systemd requests an update to the unit file for watchdog.service
> due to the contents of PIDFile:
>
>    systemd[1]: /usr/lib/systemd/system/watchdog.service:11: PIDFile=
>      references a path below legacy directory /var/run/, updating
>      /var/run/watchdog.pid → /run/watchdog.pid; please update the
>      unit file accordingly.
>
> Use sed in do_install_append to fix the path from
> /var/run/watchdog.pid to /run/watchdog.pid. This change is
> recommended in services with the "forking" type (see commit
> a9353a5c5b in systemd source).
>
> Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
> ---
>   meta/recipes-extended/watchdog/watchdog_5.15.bb | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> index 1acab2e9e7..83a4ef27cf 100644
> --- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
> +++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
> @@ -51,8 +51,12 @@ do_install_append() {
>   
>   	install -Dm 0755 ${WORKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
>   	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
> +
> +    # watchdog is of type "forking", so fix PIDFile to avoid warnings from
> +    # systemd
> +    sed -i 's@/var/run@/run@g' ${D}${systemd_system_unitdir}/watchdog.service
>   
> -	# watchdog.conf is provided by the watchdog-config recipe
> +    # watchdog.conf is provided by the watchdog-config recipe
>   	rm ${D}${sysconfdir}/watchdog.conf
>   }
>   

There are other instances of this warning regarding unit files. For 
example, during core-image-minimal boot for qemux86-64:

|[    3.845927] systemd[1]: /lib/systemd/system/dbus.socket:5: 
ListenStream= references a path below legacy directory /var/run/, 
updating /var/run/dbus/system_bus_socket → /run/dbus/system_bus_socket|



--------------A92B3880CE99F64BE14A5DB1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>On 10/2/19 2:28 PM, Trevor Gamblin wrote:<br>
    </p>
    <blockquote type="cite"
      cite="mid:20191002182824.38571-1-Trevor.Gamblin@windriver.com">
      <pre class="moz-quote-pre" wrap="">From: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>

systemd requests an update to the unit file for watchdog.service
due to the contents of PIDFile:

  systemd[1]: /usr/lib/systemd/system/watchdog.service:11: PIDFile=
    references a path below legacy directory /var/run/, updating
    /var/run/watchdog.pid → /run/watchdog.pid; please update the
    unit file accordingly.

Use sed in do_install_append to fix the path from
/var/run/watchdog.pid to /run/watchdog.pid. This change is
recommended in services with the "forking" type (see commit
a9353a5c5b in systemd source).

Signed-off-by: Trevor Gamblin <a class="moz-txt-link-rfc2396E" href="mailto:trevor.gamblin@windriver.com">&lt;trevor.gamblin@windriver.com&gt;</a>
---
 meta/recipes-extended/watchdog/watchdog_5.15.bb | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/watchdog/watchdog_5.15.bb b/meta/recipes-extended/watchdog/watchdog_5.15.bb
index 1acab2e9e7..83a4ef27cf 100644
--- a/meta/recipes-extended/watchdog/watchdog_5.15.bb
+++ b/meta/recipes-extended/watchdog/watchdog_5.15.bb
@@ -51,8 +51,12 @@ do_install_append() {
 
 	install -Dm 0755 ${WORKDIR}/watchdog.init ${D}/${sysconfdir}/init.d/watchdog
 	install -Dm 0755 ${WORKDIR}/wd_keepalive.init ${D}${sysconfdir}/init.d/wd_keepalive
+    
+    # watchdog is of type "forking", so fix PIDFile to avoid warnings from
+    # systemd
+    sed -i 's@/var/run@/run@g' ${D}${systemd_system_unitdir}/watchdog.service
 
-	# watchdog.conf is provided by the watchdog-config recipe
+    # watchdog.conf is provided by the watchdog-config recipe
 	rm ${D}${sysconfdir}/watchdog.conf
 }
 
</pre>
    </blockquote>
    <p>There are other instances of this warning regarding unit files.
      For example, during core-image-minimal boot for qemux86-64:</p>
    <p><code>[    3.845927] systemd[1]:
        /lib/systemd/system/dbus.socket:5: ListenStream= references a
        path below legacy directory /var/run/, updating
        /var/run/dbus/system_bus_socket → /run/dbus/system_bus_socket</code></p>
    <p><br>
    </p>
  </body>
</html>

--------------A92B3880CE99F64BE14A5DB1--
