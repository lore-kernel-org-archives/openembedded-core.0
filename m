Received: from mail-ia0-f182.google.com ([209.85.210.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1URUsv-0004EJ-Hp
	for openembedded-core@lists.openembedded.org;
	Sun, 14 Apr 2013 23:55:09 +0200
Received: by mail-ia0-f182.google.com with SMTP id u20so3778415iag.41
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 14:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=g2Z3McIUWsbInFhk4doIf3OZlYwMHfnXqF2loESS5qc=;
	b=OSIRfPjrU/1WalQQO3pv078ABNGKDOyTmt41lkqTLsFdNUcKBJNcqLQKwLwjD7n7Dh
	VQo7DM1+p+pDKgCCCfGX+jZfHFZJ5P18lkw4TiH0fP1LmksqkBZmtwWRzTKKLBAET8A4
	ZR+AkMr1BOQpIUUKuOekrmTXq3kRV7oHr2XiWI/qH2ACF3lRFFaF4wjK14fALwYRHiZz
	ox/LQlHliwPrLnveIscIFlm7HXG8fFu0e6h7OLalo76Y+6nRqIOUz2enLFGYnyl2BhWk
	Q0XQj5LmzNXQ2dE89cIBlf6km3ZPiKlANw3GhcYnt1RSfz6T3FxDJiENDp0CpdYO9O3A
	Lv3A==
MIME-Version: 1.0
X-Received: by 10.50.119.104 with SMTP id kt8mr3723661igb.0.1365975445141;
	Sun, 14 Apr 2013 14:37:25 -0700 (PDT)
Received: by 10.50.191.170 with HTTP; Sun, 14 Apr 2013 14:37:25 -0700 (PDT)
In-Reply-To: <1365835876-28667-1-git-send-email-sgw@linux.intel.com>
References: <1365835876-28667-1-git-send-email-sgw@linux.intel.com>
Date: Sun, 14 Apr 2013 14:37:25 -0700
Message-ID: <CAMKF1speNy5Q5=5b1xAkj9WgoW+6nCTuXjUX5DKL_aOz9hQhPw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] udev: Update initscript to check for devtmpfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 14 Apr 2013 21:55:19 -0000
Content-Type: multipart/alternative; boundary=089e010d91562e594e04da58f1ff

--089e010d91562e594e04da58f1ff
Content-Type: text/plain; charset=UTF-8

You could also add some more text on how to enable it for the clueless

On Friday, April 12, 2013, Saul Wold <sgw@linux.intel.com> wrote:
> This is needed because the udev_182 now requires devtmpfs and will not
work correctly
> with out, so ensure that the kernel contains devtmpfs by checking
/proc/filesystems.
>
> [YOCTO #4125]
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/recipes-core/udev/udev/init | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/recipes-core/udev/udev/init
b/meta/recipes-core/udev/udev/init
> index 37b5231..2a95ab7 100644
> --- a/meta/recipes-core/udev/udev/init
> +++ b/meta/recipes-core/udev/udev/init
> @@ -35,6 +35,14 @@ case "$1" in
>      # propagate /dev from /sys
>      echo "Starting udev"
>
> +    # Check for requireed devtmpfs before trying to start udev and
> +    # mount a no-existant fs.
> +    if ! grep -q devtmpfs /proc/filesystems
> +    then
> +        echo "Missing devtmpfs, which is required for udev to run";
> +        echo "Halting..."
> +        halt
> +    fi
>      # mount the tmpfs on /dev, if not already done
>      LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") {
exit 1 }' /proc/mounts && {
>              mount -n -o mode=0755 -t tmpfs none "/dev"
> --
> 1.8.0.2
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

--089e010d91562e594e04da58f1ff
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

You could also add some more text on how to enable it for the clueless<br><=
br>On Friday, April 12, 2013, Saul Wold &lt;<a href=3D"mailto:sgw@linux.int=
el.com">sgw@linux.intel.com</a>&gt; wrote:<br>&gt; This is needed because t=
he udev_182 now requires devtmpfs and will not work correctly<br>
&gt; with out, so ensure that the kernel contains devtmpfs by checking /pro=
c/filesystems.<br>&gt;<br>&gt; [YOCTO #4125]<br>&gt;<br>&gt; Signed-off-by:=
 Saul Wold &lt;<a href=3D"mailto:sgw@linux.intel.com">sgw@linux.intel.com</=
a>&gt;<br>
&gt; ---<br>&gt; =C2=A0meta/recipes-core/udev/udev/init | 8 ++++++++<br>&gt=
; =C2=A01 file changed, 8 insertions(+)<br>&gt;<br>&gt; diff --git a/meta/r=
ecipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init<br>&gt; index=
 37b5231..2a95ab7 100644<br>
&gt; --- a/meta/recipes-core/udev/udev/init<br>&gt; +++ b/meta/recipes-core=
/udev/udev/init<br>&gt; @@ -35,6 +35,14 @@ case &quot;$1&quot; in<br>&gt; =
=C2=A0 =C2=A0 =C2=A0# propagate /dev from /sys<br>&gt; =C2=A0 =C2=A0 =C2=A0=
echo &quot;Starting udev&quot;<br>
&gt;<br>&gt; + =C2=A0 =C2=A0# Check for requireed devtmpfs before trying to=
 start udev and<br>&gt; + =C2=A0 =C2=A0# mount a no-existant fs.<br>&gt; + =
=C2=A0 =C2=A0if ! grep -q devtmpfs /proc/filesystems<br>&gt; + =C2=A0 =C2=
=A0then<br>&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Missing devtmpfs, w=
hich is required for udev to run&quot;;<br>
&gt; + =C2=A0 =C2=A0 =C2=A0 =C2=A0echo &quot;Halting...&quot;<br>&gt; + =C2=
=A0 =C2=A0 =C2=A0 =C2=A0halt<br>&gt; + =C2=A0 =C2=A0fi<br>&gt; =C2=A0 =C2=
=A0 =C2=A0# mount the tmpfs on /dev, if not already done<br>&gt; =C2=A0 =C2=
=A0 =C2=A0LANG=3DC awk &#39;$2 =3D=3D &quot;/dev&quot; &amp;&amp; ($3 =3D=
=3D &quot;tmpfs&quot; || $3 =3D=3D &quot;devtmpfs&quot;) { exit 1 }&#39; /p=
roc/mounts &amp;&amp; {<br>
&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mount -n -o mode=3D075=
5 -t tmpfs none &quot;/dev&quot;<br>&gt; --<br>&gt; 1.8.0.2<br>&gt;<br>&gt;=
<br>&gt; _______________________________________________<br>&gt; Openembedd=
ed-core mailing list<br>&gt; <a href=3D"mailto:Openembedded-core@lists.open=
embedded.org">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openemb=
edded-core">http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedde=
d-core</a><br>&gt;

--089e010d91562e594e04da58f1ff--
