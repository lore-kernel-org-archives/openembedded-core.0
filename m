Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
 by mx.groups.io with SMTP id smtpd.web11.4817.1615979426593419567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Mar 2021 04:10:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HDv7elY9;
 spf=pass (domain: gmail.com, ip: 209.85.217.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f51.google.com with SMTP id a15so811891vsi.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Mar 2021 04:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VCron1SOZLXrmyVHJUKwJxGPI6dVFoabDdupWeneNi0=;
        b=HDv7elY9FEpDhgTt3X522CbPKoKv1GbFgmx2u3VacZ4/ePSJZtQUgKwlt+WTdZswmu
         3hHT5T7676mlMjaDfmPiDp76QIgJWkxcreIotA4avXt42wp6qsfGxpBCbWOK8ty5Eq/i
         9PZjV7qg3P2/QYRKDBH+xVrEn9fN3W/BAAUZ9zxN2jCi81N2+3go0EQkPtWrIJWSgnqS
         puFLXOsGdl9+MVaPbE3uos40cZs6WS8S/EMyrqVaEtndewXWRB0cGs5sFJuQsxac46+4
         /esTxiv38Nbn1kI5DfK7m9zfI1wXkZuUWp2duRD4ROlmYB79U3rZLK7+qg/d4P1p0Rd+
         Vpkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VCron1SOZLXrmyVHJUKwJxGPI6dVFoabDdupWeneNi0=;
        b=N+K/oVlXB4Zdc0MEQ21ukivkAnAp5mVlBQp7z6w8ip0RdIkvV6Ab0Zp6r80oA1j/s1
         rHvJwZiRQuGNfYOnpE65hjm7xfQqO1ZxURkKIlsWvTTkG0AThtD7G2eho3EdhTLwGpV5
         4OhjXJJ7DcPX2yEMIwEJn29QTSrF1psKeCmt5LnLGhgcL7bvUyC9crJ0FvZpDPoEv91Z
         wTMNZzOI1HFOpKYqXdvnQSw8Qjji7ivcTCNoiAtnyph6v6LE13O+TvuvrhgY7PouSC8R
         Ga+Ab/1wSNO9LBz5MWpF+4+VfjEecIEfp2029aIIgE6FFMVygFS8iOQW5BcLN4CzYSGO
         JEgg==
X-Gm-Message-State: AOAM532fu7T0Abn/JmV15qWv8n3cHjy2HbluGv233I8xQ45OyQeE02uc
	1rStrJRLSuE14LA4TioSI8/QKO8OPocq+4u4YkU=
X-Google-Smtp-Source: ABdhPJwx/xQFgQbY624uPy3aJ+/V8cfcTfWM/wso4cFGKl467++1LXeCOOZOBrm5XCroJ6xdh3Fm83AwxzrCkAa7C10=
X-Received: by 2002:a67:bc11:: with SMTP id t17mr2761051vsn.51.1615979425700;
 Wed, 17 Mar 2021 04:10:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210317003155.1368207-1-raj.khem@gmail.com>
In-Reply-To: <20210317003155.1368207-1-raj.khem@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 17 Mar 2021 12:10:14 +0100
Message-ID: <CANNYZj9LrYwcTP2vswRmwiM7FYMR8DZ8CZuciTJAJ1WTQvyhzg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Reduce stack and heap sizes for jsc on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, 
	Andrei Gherzan <andrei@gherzan.com>
Content-Type: multipart/alternative; boundary="000000000000a21eab05bdb987de"

--000000000000a21eab05bdb987de
Content-Type: text/plain; charset="UTF-8"

Please Khem, send these patches upstream first.

Alex

On Wed, 17 Mar 2021 at 01:32, Khem Raj <raj.khem@gmail.com> wrote:

> Fixes
>
> [YOCTO #14281]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andrei Gherzan <andrei@gherzan.com>
> ---
>  .../webkitgtk/musl-lower-stack-usage.patch    | 51 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |  1 +
>  2 files changed, 52 insertions(+)
>  create mode 100644
> meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
>
> diff --git
> a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> new file mode 100644
> index 0000000000..3d66766d9a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch
> @@ -0,0 +1,51 @@
> +reduce thread stack and heap usage for javascriptcore on musl
> +
> +default sizes for musl are smaller compared to glibc, this matches
> +to musl defaults, avoid stack overflow crashes in jscore
> +
> +Upstream-Status: Pending
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +
> +--- a/Source/JavaScriptCore/runtime/OptionsList.h
> ++++ b/Source/JavaScriptCore/runtime/OptionsList.h
> +@@ -75,6 +75,18 @@ constexpr bool enableWebAssemblyStreamin
> + // On instantiation of the first VM instance, the Options will be write
> protected
> + // and cannot be modified thereafter.
> +
> ++#if OS(LINUX) && !defined(__GLIBC__)
> ++// non-glibc options on linux ( musl )
> ++constexpr unsigned jscMaxPerThreadStack = 80 * KB;
> ++constexpr unsigned jscSoftReservedZoneSize = 32 * KB;
> ++constexpr unsigned jscReservedZoneSize = 16 * KB;
> ++#else
> ++//default
> ++constexpr unsigned jscMaxPerThreadStack = 4 * MB;
> ++constexpr unsigned jscSoftReservedZoneSize = 128 * KB;
> ++constexpr unsigned jscReservedZoneSize = 64 * KB;
> ++#endif
> ++
> + #define FOR_EACH_JSC_OPTION(v)                                          \
> +     v(Bool, useKernTCSM, defaultTCSMValue(), Normal, "Note: this needs
> to go before other options since they depend on this value.") \
> +     v(Bool, validateOptions, false, Normal, "crashes if mis-typed JSC
> options were passed to the VM") \
> +@@ -90,9 +102,9 @@ constexpr bool enableWebAssemblyStreamin
> +     \
> +     v(Bool, reportMustSucceedExecutableAllocations, false, Normal,
> nullptr) \
> +     \
> +-    v(Unsigned, maxPerThreadStackUsage, 5 * MB, Normal, "Max allowed
> stack usage by the VM") \
> +-    v(Unsigned, softReservedZoneSize, 128 * KB, Normal, "A buffer
> greater than reservedZoneSize that reserves space for stringifying
> exceptions.") \
> +-    v(Unsigned, reservedZoneSize, 64 * KB, Normal, "The amount of stack
> space we guarantee to our clients (and to interal VM code that does not
> call out to clients).") \
> ++    v(Unsigned, maxPerThreadStackUsage, jscMaxPerThreadStack, Normal,
> "Max allowed stack usage by the VM") \
> ++    v(Unsigned, softReservedZoneSize, jscSoftReservedZoneSize, Normal,
> "A buffer greater than reservedZoneSize that reserves space for
> stringifying exceptions.") \
> ++    v(Unsigned, reservedZoneSize, jscReservedZoneSize, Normal, "The
> amount of stack space we guarantee to our clients (and to interal VM code
> that does not call out to clients).") \
> +     \
> +     v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Normal, "Forces a
> crash if we attempt to enter the VM when disallowed") \
> +     v(Bool, crashIfCantAllocateJITMemory, false, Normal, nullptr) \
> +@@ -601,7 +613,7 @@ public:
> +     bool init(const char*);
> +     bool isInRange(unsigned);
> +     const char* rangeString() const { return (m_state > InitError) ?
> m_rangeString : s_nullRangeStr; }
> +-
> ++
> +     void dump(PrintStream& out) const;
> +
> + private:
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> index d0a41f48c7..36d33f550d 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.30.5.bb
> @@ -20,6 +20,7 @@ SRC_URI = "
> https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://include_xutil.patch \
>             file://reduce-memory-overheads.patch \
>
> file://0001-Extend-atomics-check-to-include-1-byte-CAS-test.patch \
> +           file://musl-lower-stack-usage.patch \
>             "
>
>  SRC_URI[sha256sum] =
> "7d0dab08e3c5ae07bec80b2822ef42e952765d5724cac86eb23999bfed5a7f1f"
> --
> 2.31.0
>
>
> 
>
>

--000000000000a21eab05bdb987de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Please Khem, send these patches upstream first.</div>=
<div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, 17 Mar 2021 at 01:32, Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fixes<br>
<br>
[YOCTO #14281]<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Andrei Gherzan &lt;<a href=3D"mailto:andrei@gherzan.com" target=3D"_bl=
ank">andrei@gherzan.com</a>&gt;<br>
---<br>
=C2=A0.../webkitgtk/musl-lower-stack-usage.patch=C2=A0 =C2=A0 | 51 +++++++=
++++++++++++<br>
=C2=A0meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a>=C2=A0 |=C2=A0 1 =
+<br>
=C2=A02 files changed, 52 insertions(+)<br>
=C2=A0create mode 100644 meta/recipes-sato/webkit/webkitgtk/musl-lower-sta=
ck-usage.patch<br>
<br>
diff --git a/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.pat=
ch b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch<br>
new file mode 100644<br>
index 0000000000..3d66766d9a<br>
--- /dev/null<br>
+++ b/meta/recipes-sato/webkit/webkitgtk/musl-lower-stack-usage.patch<br>
@@ -0,0 +1,51 @@<br>
+reduce thread stack and heap usage for javascriptcore on musl<br>
+<br>
+default sizes for musl are smaller compared to glibc, this matches<br>
+to musl defaults, avoid stack overflow crashes in jscore<br>
+<br>
+Upstream-Status: Pending<br>
+Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
+<br>
+--- a/Source/JavaScriptCore/runtime/OptionsList.h<br>
++++ b/Source/JavaScriptCore/runtime/OptionsList.h<br>
+@@ -75,6 +75,18 @@ constexpr bool enableWebAssemblyStreamin<br>
+ // On instantiation of the first VM instance, the Options will be write =
protected<br>
+ // and cannot be modified thereafter.<br>
+ <br>
++#if OS(LINUX) &amp;&amp; !defined(__GLIBC__)<br>
++// non-glibc options on linux ( musl )<br>
++constexpr unsigned jscMaxPerThreadStack =3D 80 * KB;<br>
++constexpr unsigned jscSoftReservedZoneSize =3D 32 * KB;<br>
++constexpr unsigned jscReservedZoneSize =3D 16 * KB;<br>
++#else<br>
++//default<br>
++constexpr unsigned jscMaxPerThreadStack =3D 4 * MB;<br>
++constexpr unsigned jscSoftReservedZoneSize =3D 128 * KB;<br>
++constexpr unsigned jscReservedZoneSize =3D 64 * KB;<br>
++#endif<br>
++<br>
+ #define FOR_EACH_JSC_OPTION(v)=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
+=C2=A0 =C2=A0 =C2=A0v(Bool, useKernTCSM, defaultTCSMValue(), Normal, &quo=
t;Note: this needs to go before other options since they depend on this val=
ue.&quot;) \<br>
+=C2=A0 =C2=A0 =C2=A0v(Bool, validateOptions, false, Normal, &quot;crashes=
 if mis-typed JSC options were passed to the VM&quot;) \<br>
+@@ -90,9 +102,9 @@ constexpr bool enableWebAssemblyStreamin<br>
+=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0v(Bool, reportMustSucceedExecutableAllocations, false=
, Normal, nullptr) \<br>
+=C2=A0 =C2=A0 =C2=A0\<br>
+-=C2=A0 =C2=A0 v(Unsigned, maxPerThreadStackUsage, 5 * MB, Normal, &quot;=
Max allowed stack usage by the VM&quot;) \<br>
+-=C2=A0 =C2=A0 v(Unsigned, softReservedZoneSize, 128 * KB, Normal, &quot;=
A buffer greater than reservedZoneSize that reserves space for stringifying=
 exceptions.&quot;) \<br>
+-=C2=A0 =C2=A0 v(Unsigned, reservedZoneSize, 64 * KB, Normal, &quot;The a=
mount of stack space we guarantee to our clients (and to interal VM code th=
at does not call out to clients).&quot;) \<br>
++=C2=A0 =C2=A0 v(Unsigned, maxPerThreadStackUsage, jscMaxPerThreadStack, =
Normal, &quot;Max allowed stack usage by the VM&quot;) \<br>
++=C2=A0 =C2=A0 v(Unsigned, softReservedZoneSize, jscSoftReservedZoneSize,=
 Normal, &quot;A buffer greater than reservedZoneSize that reserves space f=
or stringifying exceptions.&quot;) \<br>
++=C2=A0 =C2=A0 v(Unsigned, reservedZoneSize, jscReservedZoneSize, Normal,=
 &quot;The amount of stack space we guarantee to our clients (and to intera=
l VM code that does not call out to clients).&quot;) \<br>
+=C2=A0 =C2=A0 =C2=A0\<br>
+=C2=A0 =C2=A0 =C2=A0v(Bool, crashOnDisallowedVMEntry, ASSERT_ENABLED, Nor=
mal, &quot;Forces a crash if we attempt to enter the VM when disallowed&quo=
t;) \<br>
+=C2=A0 =C2=A0 =C2=A0v(Bool, crashIfCantAllocateJITMemory, false, Normal, =
nullptr) \<br>
+@@ -601,7 +613,7 @@ public:<br>
+=C2=A0 =C2=A0 =C2=A0bool init(const char*);<br>
+=C2=A0 =C2=A0 =C2=A0bool isInRange(unsigned);<br>
+=C2=A0 =C2=A0 =C2=A0const char* rangeString() const { return (m_state &gt=
; InitError) ? m_rangeString : s_nullRangeStr; }<br>
+-=C2=A0 =C2=A0 <br>
++<br>
+=C2=A0 =C2=A0 =C2=A0void dump(PrintStream&amp; out) const;<br>
+ <br>
+ private:<br>
diff --git a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.b=
b" rel=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a> b/meta/reci=
pes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=3D"noreferrer" t=
arget=3D"_blank">webkitgtk_2.30.5.bb</a><br>
index d0a41f48c7..36d33f550d 100644<br>
--- a/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
+++ b/meta/recipes-sato/webkit/<a href=3D"http://webkitgtk_2.30.5.bb" rel=
=3D"noreferrer" target=3D"_blank">webkitgtk_2.30.5.bb</a><br>
@@ -20,6 +20,7 @@ SRC_URI =3D &quot;<a href=3D"https://www.webkitgtk.org/r=
eleases/$%7BBPN%7D-$%7BPV%7D.tar.xz" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://include_xutil.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://reduce-memory-overheads.p=
atch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Extend-atomics-check=
-to-include-1-byte-CAS-test.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://musl-lower-stack-usage.pa=
tch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0SRC_URI[sha256sum] =3D &quot;7d0dab08e3c5ae07bec80b2822ef42e952765d5=
724cac86eb23999bfed5a7f1f&quot;<br>
-- <br>
2.31.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--000000000000a21eab05bdb987de--
