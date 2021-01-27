Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.web11.12691.1611774697774674994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Jan 2021 11:11:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NfSRRB5g;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id rv9so4174853ejb.13
        for <openembedded-core@lists.openembedded.org>; Wed, 27 Jan 2021 11:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ji94UULNS1lIHPuAGaCW9COOhyHjcaMQLCOyYGt590g=;
        b=NfSRRB5glh97iLdeG6q0tR64SyrrJ/jZAOcOvCIHbEEB7TTXJawkhZ/J6BGtQy2eRF
         itXL+d5De3NixLrIimo6j4Pc0wZ6y4EoE1eaDIdTwrHdvWMGWzsxTLGxX998NAv4K6O/
         S3KRBVDIEVEh+Njr1TAwQV0mebLZ5Va0jST1yCB6K5t8qXm3GUosVcJcRJ4BpSVBF6lZ
         BXbWIM9yJmmtdqy6fNckFpdxPKOixueCmEDzv2IqIZtCHrw2q3UdthHd2XMnXwtAwANH
         0tj89CNC5XHGYa06lZEuDbdY312MFrwipkGwDjY5Q/MyUBTj/EwyE9IzMkP7+6/Vzdsf
         M4uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ji94UULNS1lIHPuAGaCW9COOhyHjcaMQLCOyYGt590g=;
        b=fdDFp1WlMimpCeP2lSMdmALFdMtDyQ1QAx1QCk3wv5NFlxawGPPsSZPkKkuUdxbBYV
         LmCuw68N08x4yvlzP9Hs6MNkFE5fYY4fqc0WCZKhnhHRfAKdW1QVU1FiPIwI5VFElOdW
         Es1YwPeJ6Zf2ui1cCYaF/Fnp+NNUYlit+iOeVdEtauVnX7G5sysVNMuuu5x5L+MI4Ug2
         qU6ixadXMV0dRh9DwlMRb9EbwstKWMVNhxlwPma0LEFg/vJXEd7xNKStcRd2CLXn/cbI
         4/BvlmavYvH7PO7qEPIc/d2DFZEXy9SFd1EoIJkXyKjmeG0RQ90LOmVctiYxIGptwNlh
         ZzZg==
X-Gm-Message-State: AOAM530PsRSp0/+fz/lkkdHg1HWyGdQDJUtuqBb1WLI+fYjjid2iSvq2
	TOEMOa3Lk9f6m0xTUeygYE61vcwAJtOSmD1RkOo=
X-Google-Smtp-Source: ABdhPJxNsXjxQODYt959y9H4k1zrueOR3shV6mcs37sUpDOghdUR0tFyTHJL9zA7xXkZOFdqcqqKtEyCz2s8yYqoD/Y=
X-Received: by 2002:a17:906:6846:: with SMTP id a6mr7766070ejs.470.1611774696341;
 Wed, 27 Jan 2021 11:11:36 -0800 (PST)
MIME-Version: 1.0
References: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
In-Reply-To: <20210124095546.3329-1-tomasz.dziendzielski@gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 27 Jan 2021 20:11:25 +0100
Message-ID: <CA+chaQdyeDPFaitWi-42dZi-W=E0ss2_SeyvOjJ7EdmZisCwhA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] insane: Add test for native/nativesdk inherit order
To: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003bc8ff05b9e68a4f"

--0000000000003bc8ff05b9e68a4f
Content-Type: text/plain; charset="UTF-8"

Would it make sense to show some shortened version of inherited_classes?

The whole variable is too long, e.g. in my case with:
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3597943ddd..03481489c3 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -1387,7 +1387,7 @@ python () {
                             break
                     else:
                         pn = d.getVar('PN')
-                        package_qa_handle_error("native-last", "%s:
native/nativesdk class is not inherited last, this can result in unexpected
behaviour. " % pn, d)
+                        package_qa_handle_error("native-last", "%s:
native/nativesdk class is not inherited last, this can result in unexpected
behaviour. Current order: '%s'" % (pn, inherited_classes), d)
                         break
                 else:
                     break

it shows:
WARNING: /jenkins/mjansa/build/ose-github/hardknott/meta-qt5/recipes-qt/qt5/
qtbase-native_git.bb: QA Issue: qtbase-native: native/nativesdk class is
not inherited last, this can result in unexpected behaviour. Current order:
'['/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/image-artifact-names.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/base.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/patch.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/terminal.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/staging.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos/classes/mirrors.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/utils.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/utility-tasks.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/metadata_scm.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/logging.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-virtualization/classes/sanity-meta-virt.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/own-mirrors.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/rm_work.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-updater/classes/sota.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-updater/classes/sota_sanity.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos-raspberrypi/classes/sota_webos-rpi.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/reproducible_build_simple.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/uninative.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/package_ipk.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/package.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/packagedata.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/chrpath.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/package_pkgdata.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/insane.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/buildhistory.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/buildstats.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/image-mklibs.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/linuxloader.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-virtualization/classes/meta-virt-cfg.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-virtualization/classes/meta-virt-k8s-cfg.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-virtualization/classes/meta-virt-xen-cfg.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/debian.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/devshell.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/sstate.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/license.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/buildstats-summary.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos/classes/webos_base.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/remove-libtool.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/image-buildinfo.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/icecc.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/blacklist.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/sanity.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-qt5/classes/qmake5_base.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-qt5/classes/qmake5_paths.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/native.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/relocatable.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/nopackages.bbclass',
'/jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos/classes/webos_qmake5_base.bbclass']'
[native-last]

It would make it a bit easier to find out, what was inheritted after
native/nativesdk as "bitbake -e" doesn't show it very clearly (or I don't
see it there).

Which also points to interesting case caused by
https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-qt/qt5/qtbase-native_git.bbappend
which inherits:
https://github.com/webosose/meta-webosose/blob/master/meta-webos/classes/webos_qmake5_base.bbclass
but because it's a bbappend, it's not easy to re-order inherits to make
this QA check happy (the webos_qmake5_base.bbclass should be safe to
inherit after native(sdk) anyway).

So I guess when someone needs to inherit something for native recipe from
bbappend, then the only option is to use .inc file instead of .bbclass or
ignore this warning? Unfortunately INSANE_SKIP doesn't seem to work with
native-last as well. Is this expected?
https://bugzilla.yoctoproject.org/show_bug.cgi?id=5729 doesn't really show
what exact issues this QA check is going to prevent.

Regards,

On Sun, Jan 24, 2021 at 10:53 AM Tomasz Dziendzielski <
tomasz.dziendzielski@gmail.com> wrote:

> Classes native/nativesdk should be inherited last to prevent unexpected
> behaviour.
>
> [YOCTO #5729]
>
> Signed-off-by: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
> ---
>  meta/classes/insane.bbclass | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
> index 105d2a5ce8..3597943ddd 100644
> --- a/meta/classes/insane.bbclass
> +++ b/meta/classes/insane.bbclass
> @@ -27,7 +27,7 @@ WARN_QA ?= " libdir xorg-driver-abi \
>              infodir build-deps src-uri-bad symlink-to-sysroot multilib \
>              invalid-packageconfig host-user-contaminated uppercase-pn
> patch-fuzz \
>              mime mime-xdg unlisted-pkg-lics unhandled-features-check \
> -            missing-update-alternatives \
> +            missing-update-alternatives native-last \
>              "
>  ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la \
>              perms dep-cmp pkgvarcheck perm-config perm-line perm-link \
> @@ -1366,6 +1366,32 @@ python () {
>          d.setVarFlag('do_package_qa', 'rdeptask', '')
>      for i in issues:
>          package_qa_handle_error("pkgvarcheck", "%s: Variable %s is set as
> not being package specific, please fix this." % (d.getVar("FILE"), i), d)
> +
> +    for native_class in ['native', 'nativesdk']:
> +        if bb.data.inherits_class(native_class, d):
> +
> +            inherited_classes = d.getVar('__inherit_cache', False) or []
> +            needle = os.path.join('classes', native_class)
> +
> +            bbclassextend = (d.getVar('BBCLASSEXTEND') or '').split()
> +            # BBCLASSEXTEND items are always added in the end
> +            skip_classes = bbclassextend
> +            if bb.data.inherits_class('native', d) or 'native' in
> bbclassextend:
> +                # native also inherits nopackages and relocatable
> bbclasses
> +                skip_classes.extend(['nopackages', 'relocatable'])
> +
> +            for class_item in reversed(inherited_classes):
> +                if needle not in class_item:
> +                    for extend_item in skip_classes:
> +                        if os.path.join('classes', '%s.bbclass' %
> extend_item) in class_item:
> +                            break
> +                    else:
> +                        pn = d.getVar('PN')
> +                        package_qa_handle_error("native-last", "%s:
> native/nativesdk class is not inherited last, this can result in unexpected
> behaviour. " % pn, d)
> +                        break
> +                else:
> +                    break
> +
>      qa_sane = d.getVar("QA_SANE")
>      if not qa_sane:
>          bb.fatal("Fatal QA errors found, failing task.")
> --
> 2.29.2
>
>
> 
>
>

--0000000000003bc8ff05b9e68a4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Would it make sense to show some shortened version of inhe=
rited_classes?<div><br></div><div>The whole variable is too long, e.g. in m=
y case with:</div><div>diff --git a/meta/classes/insane.bbclass b/meta/clas=
ses/insane.bbclass<br>index 3597943ddd..03481489c3 100644<br>--- a/meta/cla=
sses/insane.bbclass<br>+++ b/meta/classes/insane.bbclass<br>@@ -1387,7 +138=
7,7 @@ python () {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break<br>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0else:<br>=C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0pn =3D d.getVar(&#39;PN&#39;)<br>- =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_hand=
le_error(&quot;native-last&quot;, &quot;%s: native/nativesdk class is not i=
nherited last, this can result in unexpected behaviour. &quot; % pn, d)<br>=
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0package_qa_handle_error(&quot;native-last&quot;, &quot;%s: nativ=
e/nativesdk class is not inherited last, this can result in unexpected beha=
viour. Current order: &#39;%s&#39;&quot; % (pn, inherited_classes), d)<br>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0break<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0else:<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0break<br></div><div><br></div><div>it shows:</div>=
<div>WARNING: /jenkins/mjansa/build/ose-github/hardknott/meta-qt5/recipes-q=
t/qt5/<a href=3D"http://qtbase-native_git.bb">qtbase-native_git.bb</a>: QA =
Issue: qtbase-native: native/nativesdk class is not inherited last, this ca=
n result in unexpected behaviour. Current order: &#39;[&#39;/jenkins/mjansa=
/build/ose-github/hardknott/oe-core/meta/classes/image-artifact-names.bbcla=
ss&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/class=
es/base.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-co=
re/meta/classes/patch.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/h=
ardknott/oe-core/meta/classes/terminal.bbclass&#39;, &#39;/jenkins/mjansa/b=
uild/ose-github/hardknott/oe-core/meta/classes/staging.bbclass&#39;, &#39;/=
jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos/classes/=
mirrors.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-co=
re/meta/classes/utils.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/h=
ardknott/oe-core/meta/classes/utility-tasks.bbclass&#39;, &#39;/jenkins/mja=
nsa/build/ose-github/hardknott/oe-core/meta/classes/metadata_scm.bbclass&#3=
9;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/lo=
gging.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/meta-vi=
rtualization/classes/sanity-meta-virt.bbclass&#39;, &#39;/jenkins/mjansa/bu=
ild/ose-github/hardknott/oe-core/meta/classes/own-mirrors.bbclass&#39;, &#3=
9;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/rm_work.b=
bclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/meta-updater/c=
lasses/sota.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/m=
eta-updater/classes/sota_sanity.bbclass&#39;, &#39;/jenkins/mjansa/build/os=
e-github/hardknott/meta-webosose/meta-webos-raspberrypi/classes/sota_webos-=
rpi.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/m=
eta/classes/reproducible_build_simple.bbclass&#39;, &#39;/jenkins/mjansa/bu=
ild/ose-github/hardknott/oe-core/meta/classes/uninative.bbclass&#39;, &#39;=
/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/package_ipk=
.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta=
/classes/package.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardkn=
ott/oe-core/meta/classes/packagedata.bbclass&#39;, &#39;/jenkins/mjansa/bui=
ld/ose-github/hardknott/oe-core/meta/classes/chrpath.bbclass&#39;, &#39;/je=
nkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/package_pkgdat=
a.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/met=
a/classes/insane.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardkn=
ott/oe-core/meta/classes/buildhistory.bbclass&#39;, &#39;/jenkins/mjansa/bu=
ild/ose-github/hardknott/oe-core/meta/classes/buildstats.bbclass&#39;, &#39=
;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/image-mkli=
bs.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/me=
ta/classes/linuxloader.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/=
hardknott/meta-virtualization/classes/meta-virt-cfg.bbclass&#39;, &#39;/jen=
kins/mjansa/build/ose-github/hardknott/meta-virtualization/classes/meta-vir=
t-k8s-cfg.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/met=
a-virtualization/classes/meta-virt-xen-cfg.bbclass&#39;, &#39;/jenkins/mjan=
sa/build/ose-github/hardknott/oe-core/meta/classes/debian.bbclass&#39;, &#3=
9;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/devshell.=
bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/=
classes/sstate.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknot=
t/oe-core/meta/classes/license.bbclass&#39;, &#39;/jenkins/mjansa/build/ose=
-github/hardknott/oe-core/meta/classes/buildstats-summary.bbclass&#39;, &#3=
9;/jenkins/mjansa/build/ose-github/hardknott/meta-webosose/meta-webos/class=
es/webos_base.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott=
/oe-core/meta/classes/remove-libtool.bbclass&#39;, &#39;/jenkins/mjansa/bui=
ld/ose-github/hardknott/oe-core/meta/classes/image-buildinfo.bbclass&#39;, =
&#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/icecc.=
bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/=
classes/blacklist.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardk=
nott/oe-core/meta/classes/sanity.bbclass&#39;, &#39;/jenkins/mjansa/build/o=
se-github/hardknott/meta-qt5/classes/qmake5_base.bbclass&#39;, &#39;/jenkin=
s/mjansa/build/ose-github/hardknott/meta-qt5/classes/qmake5_paths.bbclass&#=
39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core/meta/classes/n=
ative.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-github/hardknott/oe-core=
/meta/classes/relocatable.bbclass&#39;, &#39;/jenkins/mjansa/build/ose-gith=
ub/hardknott/oe-core/meta/classes/nopackages.bbclass&#39;, &#39;/jenkins/mj=
ansa/build/ose-github/hardknott/meta-webosose/meta-webos/classes/webos_qmak=
e5_base.bbclass&#39;]&#39; [native-last]<br></div><div><br></div><div>It wo=
uld make it a bit easier to find out, what was inheritted after native/nati=
vesdk as &quot;bitbake -e&quot; doesn&#39;t show it very clearly (or I don&=
#39;t see it there).</div><div><br></div><div>Which also points to interest=
ing case caused by</div><div><a href=3D"https://github.com/webosose/meta-we=
bosose/blob/master/meta-webos/recipes-qt/qt5/qtbase-native_git.bbappend">ht=
tps://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-qt/q=
t5/qtbase-native_git.bbappend</a><br></div><div>which inherits:</div><div><=
a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta-webos/=
classes/webos_qmake5_base.bbclass">https://github.com/webosose/meta-webosos=
e/blob/master/meta-webos/classes/webos_qmake5_base.bbclass</a><br></div><di=
v>but because it&#39;s a bbappend, it&#39;s not easy to re-order inherits t=
o make this QA check happy (the=C2=A0webos_qmake5_base.bbclass should be sa=
fe to inherit after native(sdk) anyway).</div><div><br></div><div>So I gues=
s when someone needs to inherit something for native recipe from bbappend, =
then the only option is to use .inc file instead of .bbclass or ignore this=
 warning? Unfortunately INSANE_SKIP doesn&#39;t seem to work with native-la=
st as well. Is this expected?=C2=A0<a href=3D"https://bugzilla.yoctoproject=
.org/show_bug.cgi?id=3D5729">https://bugzilla.yoctoproject.org/show_bug.cgi=
?id=3D5729</a> doesn&#39;t really show what exact issues this QA check is g=
oing to prevent.</div><div><br></div><div>Regards,</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jan 24, 202=
1 at 10:53 AM Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dziendziels=
ki@gmail.com">tomasz.dziendzielski@gmail.com</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Classes native/nativesdk should=
 be inherited last to prevent unexpected<br>
behaviour.<br>
<br>
[YOCTO #5729]<br>
<br>
Signed-off-by: Tomasz Dziendzielski &lt;<a href=3D"mailto:tomasz.dziendzie=
lski@gmail.com" target=3D"_blank">tomasz.dziendzielski@gmail.com</a>&gt;<br=
>
---<br>
=C2=A0meta/classes/insane.bbclass | 28 +++++++++++++++++++++++++++-<br>
=C2=A01 file changed, 27 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass<br>
index 105d2a5ce8..3597943ddd 100644<br>
--- a/meta/classes/insane.bbclass<br>
+++ b/meta/classes/insane.bbclass<br>
@@ -27,7 +27,7 @@ WARN_QA ?=3D &quot; libdir xorg-driver-abi \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0infodir build-deps src-uri=
-bad symlink-to-sysroot multilib \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0invalid-packageconfig host=
-user-contaminated uppercase-pn patch-fuzz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mime mime-xdg unlisted-pkg=
-lics unhandled-features-check \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-update-alternatives \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 missing-update-alternatives nat=
ive-last \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
=C2=A0ERROR_QA ?=3D &quot;dev-so debug-deps dev-deps debug-files arch pkgc=
onfig la \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0perms dep-cmp pkgvarcheck =
perm-config perm-line perm-link \<br>
@@ -1366,6 +1366,32 @@ python () {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0d.setVarFlag(&#39;do_package_qa&#39;, &#=
39;rdeptask&#39;, &#39;&#39;)<br>
=C2=A0 =C2=A0 =C2=A0for i in issues:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0package_qa_handle_error(&quot;pkgvarchec=
k&quot;, &quot;%s: Variable %s is set as not being package specific, please=
 fix this.&quot; % (d.getVar(&quot;FILE&quot;), i), d)<br>
+<br>
+=C2=A0 =C2=A0 for native_class in [&#39;native&#39;, &#39;nativesdk&#39;]=
:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(native_class, d):<b=
r>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 inherited_classes =3D d.getVar(=
&#39;__inherit_cache&#39;, False) or []<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 needle =3D os.path.join(&#39;cl=
asses&#39;, native_class)<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bbclassextend =3D (d.getVar(&#3=
9;BBCLASSEXTEND&#39;) or &#39;&#39;).split()<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # BBCLASSEXTEND items are alway=
s added in the end<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_classes =3D bbclassextend<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if bb.data.inherits_class(&#39;=
native&#39;, d) or &#39;native&#39; in bbclassextend:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # native also inh=
erits nopackages and relocatable bbclasses<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 skip_classes.exte=
nd([&#39;nopackages&#39;, &#39;relocatable&#39;])<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for class_item in reversed(inhe=
rited_classes):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if needle not in =
class_item:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for=
 extend_item in skip_classes:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 if os.path.join(&#39;classes&#39;, &#39;%s.bbclass&#39; % exten=
d_item) in class_item:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 =C2=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 els=
e:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 pn =3D d.getVar(&#39;PN&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 package_qa_handle_error(&quot;native-last&quot;, &quot;%s: nati=
ve/nativesdk class is not inherited last, this can result in unexpected beh=
aviour. &quot; % pn, d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=
=A0 =C2=A0 break<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bre=
ak<br>
+<br>
=C2=A0 =C2=A0 =C2=A0qa_sane =3D d.getVar(&quot;QA_SANE&quot;)<br>
=C2=A0 =C2=A0 =C2=A0if not qa_sane:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;Fatal QA errors found, fa=
iling task.&quot;)<br>
-- <br>
2.29.2<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000003bc8ff05b9e68a4f--
