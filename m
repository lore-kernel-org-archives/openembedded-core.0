Return-Path: <n.merinov@inango-systems.com>
Received: from main-2.inango-systems.com (main-2.inango-systems.com
	[193.200.241.242])
	by mail.openembedded.org (Postfix) with ESMTP id 521F77820E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 08:22:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by main-2.inango-systems.com (Postfix) with ESMTP id CEB4332DE85
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Jul 2017 11:13:09 +0300 (IDT)
X-Virus-Scanned: Debian amavisd-new at mail.inango-systems.com
Received: from main-2.inango-systems.com ([127.0.0.1])
	by localhost (main-2.inango-systems.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id DbZajwtBDRTa; Wed, 26 Jul 2017 11:13:07 +0300 (IDT)
Received: from [192.168.73.123] (unknown [194.60.247.123])
	by main-2.inango-systems.com (Postfix) with ESMTPSA id 0A28632DE76;
	Wed, 26 Jul 2017 11:13:06 +0300 (IDT)
To: openembedded-core@lists.openembedded.org
References: <20170726080508.12586-1-n.merinov@inango-systems.com>
From: Nikolay Merinov <n.merinov@inango-systems.com>
Organization: Inango-SW LTD
Message-ID: <ba015c4a-cb79-8dfa-ee65-7195042a50fb@inango-systems.com>
Date: Wed, 26 Jul 2017 13:13:26 +0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:54.0) Gecko/20100101
	Thunderbird/54.0
MIME-Version: 1.0
In-Reply-To: <20170726080508.12586-1-n.merinov@inango-systems.com>
Subject: Re: [meta-oe][krogoth][morty][PATCH] systemd: Disable DefaultDependencies for sysv scripts on rcS runlevel
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
X-List-Received-Date: Wed, 26 Jul 2017 08:22:04 -0000
X-Groupsio-MsgNum: 100720
Content-Type: multipart/alternative;
	boundary="------------40DC1D68B320FEC8DC4688D9"
Content-Language: en-US

--------------40DC1D68B320FEC8DC4688D9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Incorrect tags, please ignore this mail

On 7/26/17 1:05 PM, Nikolay Merinov wrote:
> systemd-sysv-generator translate sysv services on rcS runlevel to
> services that starts before sysinit.target. This behavour conflict
> with default dependency on same tartget.
>
> String that define "DefaultDependency=no" was lost from patch for
> sysv generator during porting patches to systemd 229 in commit
> 64ab17b707dc431aaed880d6d8615971243f46f8.
>
> Current commit returns changes required for services that work on
> rcS runlevel.
>
> Signed-off-by: Nikolay Merinov <n.merinov@inango-systems.com>
> ---
>   ...nerator-add-support-for-executing-scripts-und.patch | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> index ac67f65685..5736f57814 100644
> --- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> +++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
> @@ -57,7 +57,17 @@ index b5925a4..ea06d6a 100644
>    } SysvStub;
>    
>    static void free_sysvstub(SysvStub *s) {
> -@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
> +@@ -194,6 +198,9 @@ static int generate_unit_file(SysvStub *s) {
> +         if (s->description)
> +                 fprintf(f, "Description=%s\n", s->description);
> +
> ++        if (!s->default_dependencies)
> ++                fprintf(f, "DefaultDependencies=no\n");
> ++
> +         STRV_FOREACH(p, s->before)
> +                 fprintf(f, "Before=%s\n", *p);
> +         STRV_FOREACH(p, s->after)
> +@@ -711,17 +720,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
>                    if (s->has_lsb && other->has_lsb)
>                            continue;
>    
> @@ -95,7 +105,7 @@ index b5925a4..ea06d6a 100644
>    
>                    /* FIXME: Maybe we should compare the name here lexicographically? */
>            }
> -@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
> +@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
>                                    return log_oom();
>    
>                            service->sysv_start_priority = -1;
> @@ -104,7 +114,7 @@ index b5925a4..ea06d6a 100644
>                            service->name = name;
>                            service->path = fpath;
>                            name = fpath = NULL;
> -@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
> +@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
>    
>                                    if (de->d_name[0] == 'S')  {
>    
> @@ -118,7 +128,7 @@ index b5925a4..ea06d6a 100644
>                                            r = set_ensure_allocated(&runlevel_services[i], NULL);
>                                            if (r < 0) {
>                                                    log_oom();
> -@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
> +@@ -887,7 +914,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
>                                            }
>    
>                                    } else if (de->d_name[0] == 'K' &&

-- 
<http://inango.com>
Nikolay Merinov
Team Leader
n.merinov@inango-systems.com
T +7 343 298 0147 C +7 912 229 2564
inango.com <http://inango.com>Inango on LinkedIn <https://www.linkedin.com/company/inango>

--------------40DC1D68B320FEC8DC4688D9
Content-Type: multipart/related;
 boundary="------------9F7104F56B105A68891EE94E"

--------------9F7104F56B105A68891EE94E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>Incorrect tags, please ignore this mail<br>
    </p>
    <div class="moz-cite-prefix">On 7/26/17 1:05 PM, Nikolay Merinov
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20170726080508.12586-1-n.merinov@inango-systems.com">
      <pre wrap="">systemd-sysv-generator translate sysv services on rcS runlevel to
services that starts before sysinit.target. This behavour conflict
with default dependency on same tartget.

String that define "DefaultDependency=no" was lost from patch for
sysv generator during porting patches to systemd 229 in commit
64ab17b707dc431aaed880d6d8615971243f46f8.

Current commit returns changes required for services that work on
rcS runlevel.

Signed-off-by: Nikolay Merinov <a class="moz-txt-link-rfc2396E" href="mailto:n.merinov@inango-systems.com">&lt;n.merinov@inango-systems.com&gt;</a>
---
 ...nerator-add-support-for-executing-scripts-und.patch | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
index ac67f65685..5736f57814 100644
--- a/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
+++ b/meta/recipes-core/systemd/systemd/0013-sysv-generator-add-support-for-executing-scripts-und.patch
@@ -57,7 +57,17 @@ index b5925a4..ea06d6a 100644
  } SysvStub;
  
  static void free_sysvstub(SysvStub *s) {
-@@ -711,17 +717,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
+@@ -194,6 +198,9 @@ static int generate_unit_file(SysvStub *s) {
+         if (s-&gt;description)
+                 fprintf(f, "Description=%s\n", s-&gt;description);
+ 
++        if (!s-&gt;default_dependencies)
++                fprintf(f, "DefaultDependencies=no\n");
++
+         STRV_FOREACH(p, s-&gt;before)
+                 fprintf(f, "Before=%s\n", *p);
+         STRV_FOREACH(p, s-&gt;after)
+@@ -711,17 +720,31 @@ static int fix_order(SysvStub *s, Hashmap *all_services) {
                  if (s-&gt;has_lsb &amp;&amp; other-&gt;has_lsb)
                          continue;
  
@@ -95,7 +105,7 @@ index b5925a4..ea06d6a 100644
  
                  /* FIXME: Maybe we should compare the name here lexicographically? */
          }
-@@ -788,6 +808,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
+@@ -788,6 +811,8 @@ static int enumerate_sysv(const LookupPaths *lp, Hashmap *all_services) {
                                  return log_oom();
  
                          service-&gt;sysv_start_priority = -1;
@@ -104,7 +114,7 @@ index b5925a4..ea06d6a 100644
                          service-&gt;name = name;
                          service-&gt;path = fpath;
                          name = fpath = NULL;
-@@ -871,9 +893,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -871,9 +896,11 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
  
                                  if (de-&gt;d_name[0] == 'S')  {
  
@@ -118,7 +128,7 @@ index b5925a4..ea06d6a 100644
                                          r = set_ensure_allocated(&amp;runlevel_services[i], NULL);
                                          if (r &lt; 0) {
                                                  log_oom();
-@@ -887,7 +911,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
+@@ -887,7 +914,8 @@ static int set_dependencies_from_rcnd(const LookupPaths *lp, Hashmap *all_servic
                                          }
  
                                  } else if (de-&gt;d_name[0] == 'K' &amp;&amp;
</pre>
    </blockquote>
    <br>
    <div class="moz-signature">-- <br>
      <div style="margin-bottom: 7px; font-family: sans-serif;"> <a
          href="http://inango.com"> <img
            src="cid:part1.84509C16.D78EDE5A@inango-systems.com"> </a>
      </div>
      <div style="color: #333333; padding-left:13px; font-family:
        sans-serif; font-size: 13px; line-height: 14px; ">
        <div style="font-weight: bold;">Nikolay Merinov</div>
        <div>Team Leader</div>
        <div style="font-size: 11px;"><a class="moz-txt-link-abbreviated" href="mailto:n.merinov@inango-systems.com">n.merinov@inango-systems.com</a></div>
        <div style="font-size: 11px; line-height: 15px;
          padding-left:5px">T +7 343 298 0147 C +7 912 229 2564</div>
      </div>
      <div style="margin-left: 13px; font-family: sans-serif; font-size:
        11px; line-height: 14px;">
        <span><a href="http://inango.com" style="text-decoration: none;
            color: #F48B00; font-weight: bold; margin-right: 5px;">inango.com</a></span><a
          href="https://www.linkedin.com/company/inango"><img
            src="cid:part4.2E9A2273.26E14E5B@inango-systems.com"
            alt="Inango on LinkedIn" style="vertical-align: top;"></a>
      </div>
    </div>
  </body>
</html>

--------------9F7104F56B105A68891EE94E
Content-Type: image/png;
 name="bephmbkkmimfbpie.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.84509C16.D78EDE5A@inango-systems.com>
Content-Disposition: inline;
 filename="bephmbkkmimfbpie.png"

iVBORw0KGgoAAAANSUhEUgAAAI4AAAA2CAMAAAAmulEiAAAACXBIWXMAAAsTAAALEwEAmpwYAAAA
GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAGNQTFRFHR0bKiooODg3R0dFVVVT
Y2NicXFwf39+jo6NnJybqqqpuLi3xsbG1NTU4+Pi8fHx9IsA9ZIP9Zkf9qAv96g/969P+LZf+b1v
+cV/+syP+9Of/Nuv/OK//enP/vDf/vjv////O48IWgAAA6JJREFUWMPNmGF7oyoQhQ+CiApC2202
Mbl6/v+v3A9RRKPNuk9vDZ/62DPwMgwzQ8CXGhj/uPYvhcP2xXC6l8Lh+bVw2v9eCqf/JEnepi/X
I3F4vpHsLyPdte0Pxel/TUfWn393xx4WeW7JE0l2x8AscPqP0/t7z+506g4O5dvlRt5CCOH9OJjU
O9fT51sIIYTTa1x0diGEEMLni+D07yGEED5ur4DTnz9+hxDC++1yavujcc6fV/L29vZxIdkdxTPg
tKf7CX2OpeJI77TnIVy6y1AqDsRpz11a1Ptjb9Y1SXqXWEnHYa21zaOZtdauzreud9Za69f0bm4w
KxJsqQr2J5KqIGkVAADZbOmmyIbPxbTCF3pvBn1uSSq18h9ZreLcCHVvU6HoNZAbWxsJ5JOmEoAs
jCkkIFzc1qbeZUBubGUkUJCYVqzFZCDdCg4JdW9TobxEPuy+AopIA+SDc62CaKLdht6JSS+hE5xk
JieHna3itB2hDComloMfvICZnC3jsl/odao3EcciMaCG8Fs4PBOZ0EzVw7olVBq4kKPdhl7P9D4T
ESebPEiSCvkmTtvhThuPeVw3T7eURMKGvgFm96zGaFEhmy3cCLgtHN4wZ4/rZvPpE5xVfQk9nz8b
LeR8X2QBvYnDePjDEIPQmNkdTnBW9Qr1clEMbhPLDATxFc78u8JaEjMJzqoeWCQ/OwirNBeMjnPb
ONlzHKcx4azrH3zQDBYGZjldDruNo7ZxXG0KpTIAasJZ1y8/RzfmsI+uNvtxfCnvhUDlxvKfcdT3
4HgJ5FUsh09xHgP2O3G8hPKrF139XSjXMXbKJY5GvRdHLy7EM5zNi14u8hRJuT+UxTwLumc4xVYa
tMureM9hO3FijRor2BMctygSVUwNYhk8JfL9OGo95W+GvpqdrhfRolhY+AzVfhyxXhA3cZpFgzGG
MhsxD6sCGXfjZKmLnXiaBskKUE3sI5P2q0x6SbIC7H4cgyzGghWiiRd5O4vXApDGmCIDTFrcNESZ
FL+K+3G8hDCOpK81hKOENNWTohIbdO3mtbYAZOVIW2ZjZ7g7K2uMQ3vSCdyVX9U40ltr3WOtHV8e
U9OM3S+zpsyVUnnpx4eS32Nt59yuNEqZqll/Z33/MGaJk//1b4P/xyt3UbT0Y636SRw1b4mbZRP7
wzjz7ML8sQH6URwvEx6v53A/j0MvAV03JJ0REDWPxUkzVSwXB+KQTamVUkqXzfOLyJcafwDne07J
Qv7f1QAAAABJRU5ErkJggg==

--------------9F7104F56B105A68891EE94E
Content-Type: image/png;
 name="jdbjleoiihlallgg.png"
Content-Transfer-Encoding: base64
Content-ID: <part4.2E9A2273.26E14E5B@inango-systems.com>
Content-Disposition: inline;
 filename="jdbjleoiihlallgg.png"

iVBORw0KGgoAAAANSUhEUgAAADgAAAAQCAIAAADMGysSAAAACXBIWXMAAAsTAAALEwEAmpwYAAAA
GXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAj9JREFUeNrUlk9u2lAQxgvKFi4Q
k33tLFiaHABzAHD2gQtADoC9SyJhFlFXOE23AfYpuQDsEb6AnQMUDkB/ZRrL4RmMlEo0I3gaxm/e
++abPya3Xq+/fAbJHRGo43SDYLF/j64bjuMeE+jDg++6ziE7n55GlUolj2bbdT6LxbvgOp32aDTc
5ZzqkikciBdEoi+XSzFWq1ahUMj0PeE7m82Snsh0Oh2PR5PJT8uqFYtF1U11OUSiKBLHWIDoeX3Y
7fe9bKCqQHWv51EfqSj/oaxWK8uqvr5GmTvzqVZySppct4siWYZj1lqtulUPkNpqNXnEGkUhBWMY
X/mgCN+cwKOzMw2LWiqnp5pt26ZporfbnXq9gcKKvlUP6YxyR5xcUS4vG/Lo+roD38lSfnmZcOjj
4w+4gSGxUzngHg7HoBTCsKgXlUoamKSWUDah/vmpaSXTrMSX7mRUFU4ZDHzRw/BvpqAclJtB487n
c0HZ7TpCDHf7/kBQEsnz84S+2X8L+Ij24qIC90k6djKqSrPZUus1CAJWEtdo2DD3ht7Z2oD4/nfD
MDhEAtvdbaFEq7ZpPnHoYvom6hGpXSUMwRyFCw4xwijcQyrzr1wux9xz9555t5WrfV2fZII7DqR5
ufwFUEbj/f03MXpeT9oZeiDy9vYGHWrPz/WPzIf8B+cLU5D6A8rd3Q3h0cWrjaBItdBP6NLgV1dN
tWtJYBiGMrzjN6qk97941zPhM4f89iv0KALfup5dDOyR6s99lr95vwUYAPJDV32BeqY/AAAAAElF
TkSuQmCC

--------------9F7104F56B105A68891EE94E--

--------------40DC1D68B320FEC8DC4688D9--
