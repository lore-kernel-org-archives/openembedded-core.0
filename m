Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1Stlxu-0003cc-Jp
	for openembedded-core@lists.openembedded.org;
	Tue, 24 Jul 2012 22:44:22 +0200
Received: by yhjj56 with SMTP id j56so6624103yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2012 13:32:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:from:date
	:message-id:subject:to:content-type:x-gm-message-state;
	bh=bWEhAmLS3HCqpCvS5SvO1Tbl/6xF4E7OI7KQg+xQ6zo=;
	b=PytvHNSDqTVttiO6OuUFhxCqngzoIQ+WgSsoDWDj0LiAmoI4QdecVAzcxYE3FdQY9E
	MtspimDoZ+UuRUrdcl86JCV+piIPhzocZoAcrP+yPr3KUUxEAbp0OwVrU/87NG53EnWy
	SY51SBKnFdGP7f7aRU3lYg8agFGKM7Mv+K+TJGSS+t/siHhUSPuyfGO/EEng/3UzUX86
	2elSpF6pfzjP629mXgnXx4CenityDDOB1Vr5SHqsj/LpkzCznZZTqQdfwMzjRe1zNCAn
	D++An1Y5Z+GQ5yzD4Q5BmhE7s4BN4k8ahvipkKvHVYNwBG3m+2ok5V6I1Fj7InwxMWD7
	v24A==
Received: by 10.42.154.199 with SMTP id r7mr18072002icw.55.1343161973409; Tue,
	24 Jul 2012 13:32:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.139.164 with HTTP; Tue, 24 Jul 2012 13:32:32 -0700 (PDT)
X-Originating-IP: [79.117.115.156]
In-Reply-To: <1342620750-2552-2-git-send-email-ross.burton@intel.com>
References: <1342620750-2552-1-git-send-email-ross.burton@intel.com>
	<1342620750-2552-2-git-send-email-ross.burton@intel.com>
From: Andrei Gherzan <andrei@gherzan.ro>
Date: Tue, 24 Jul 2012 23:32:32 +0300
Message-ID: <CAK18fxGbS1WiEtdTkUagyOGHrsCEaAG5Ruh4pzb5agg57GwZYQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkBparq7Imj8f5emcyJOWdc1L7yj10Uzq9eG9UDtgIsz9pzj8auqFivgVmM5EB21Ayu/s+k
Subject: Re: [PATCH] sanity: display the parsed PATH/BBPATH when complaining about CWD elements
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
X-List-Received-Date: Tue, 24 Jul 2012 20:44:23 -0000
Content-Type: multipart/alternative; boundary=90e6ba6e89ea4d086504c5994423

--90e6ba6e89ea4d086504c5994423
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 18, 2012 at 5:12 PM, Ross Burton <ross.burton@intel.com> wrote:

> Many people don't understand the nuances of PATH/BBPATH, so help them by
> clarifying
> the warning and displaying the parsed list element-by-element.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  meta/classes/sanity.bbclass |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index 765958e..52226f1 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -390,7 +390,8 @@ def check_sanity(sanity_data):
>
>      paths = sanity_data.getVar('PATH', True).split(":")
>      if "." in paths or "" in paths:
> -        messages = messages + "PATH contains '.' or '', which will break
> the build, please remove this."
> +        messages = messages + "PATH contains '.' or '' (empty element),
> which will break the build, please remove this.\n"
> +        messages = messages + "Parsed PATH is " + str(paths) + "\n"
>
>      bbpaths = sanity_data.getVar('BBPATH', True).split(":")
>      if "." in bbpaths or "" in bbpaths:
> @@ -402,6 +403,7 @@ def check_sanity(sanity_data):
>                  "Please check your layer.conf files and other BBPATH "
>      \
>                  "settings to remove the current working directory "
>     \
>                  "references.");
> +        bb.warn("Parsed BBPATH is" + str(bbpaths));
>
>      if sanity_data.getVar('TARGET_ARCH', True) == "arm":
>          # This path is no longer user-readable in modern (very recent)
> Linux
>

Good change.

ag

--90e6ba6e89ea4d086504c5994423
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Jul 18, 2012 at 5:12 PM, Ross Burton <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blan=
k">ross.burton@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">

Many people don&#39;t understand the nuances of PATH/BBPATH, so help them b=
y clarifying<br>
the warning and displaying the parsed list element-by-element.<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com">ros=
s.burton@intel.com</a>&gt;<br>
---<br>
=A0meta/classes/sanity.bbclass | =A0 =A04 +++-<br>
=A01 file changed, 3 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass<br>
index 765958e..52226f1 100644<br>
--- a/meta/classes/sanity.bbclass<br>
+++ b/meta/classes/sanity.bbclass<br>
@@ -390,7 +390,8 @@ def check_sanity(sanity_data):<br>
<br>
=A0 =A0 =A0paths =3D sanity_data.getVar(&#39;PATH&#39;, True).split(&quot;:=
&quot;)<br>
=A0 =A0 =A0if &quot;.&quot; in paths or &quot;&quot; in paths:<br>
- =A0 =A0 =A0 =A0messages =3D messages + &quot;PATH contains &#39;.&#39; or=
 &#39;&#39;, which will break the build, please remove this.&quot;<br>
+ =A0 =A0 =A0 =A0messages =3D messages + &quot;PATH contains &#39;.&#39; or=
 &#39;&#39; (empty element), which will break the build, please remove this=
.\n&quot;<br>
+ =A0 =A0 =A0 =A0messages =3D messages + &quot;Parsed PATH is &quot; + str(=
paths) + &quot;\n&quot;<br>
<br>
=A0 =A0 =A0bbpaths =3D sanity_data.getVar(&#39;BBPATH&#39;, True).split(&qu=
ot;:&quot;)<br>
=A0 =A0 =A0if &quot;.&quot; in bbpaths or &quot;&quot; in bbpaths:<br>
@@ -402,6 +403,7 @@ def check_sanity(sanity_data):<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;Please check your layer.conf files=
 and other BBPATH &quot; =A0 =A0 =A0 =A0\<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;settings to remove the current wor=
king directory &quot; =A0 =A0 =A0 =A0 =A0 \<br>
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0&quot;references.&quot;);<br>
+ =A0 =A0 =A0 =A0bb.warn(&quot;Parsed BBPATH is&quot; + str(bbpaths));<br>
<br>
=A0 =A0 =A0if sanity_data.getVar(&#39;TARGET_ARCH&#39;, True) =3D=3D &quot;=
arm&quot;:<br>
=A0 =A0 =A0 =A0 =A0# This path is no longer user-readable in modern (very r=
ecent) Linux<br></blockquote><div><br></div><div>Good change.=A0</div><div>=
<br></div><div>ag=A0</div></div>

--90e6ba6e89ea4d086504c5994423--
