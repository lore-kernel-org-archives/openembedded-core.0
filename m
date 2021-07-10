Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
 by mx.groups.io with SMTP id smtpd.web09.22327.1625907694084483720
 for <Openembedded-core@lists.openembedded.org>;
 Sat, 10 Jul 2021 02:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tubBG674;
 spf=pass (domain: gmail.com, ip: 209.85.217.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f48.google.com with SMTP id f4so3352055vsh.11
        for <Openembedded-core@lists.openembedded.org>; Sat, 10 Jul 2021 02:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XCI9g/rkpP6uZwbDhsFxs5VPwRnO+IbXPW64gxyIqQc=;
        b=tubBG674Vr+9rH8kPUyvXN4V2Rbtg4HSbx4hqG+ZOYWic2bsPvboIdATNYpW44UaKx
         7Xtg44wxK0mTEFx2e3wz/1m7X6rI2AcBnxVe40LixA70dG6KbzB6mgsQXLglnRJV+UTM
         ixaYNY6DZA+3YZPyiL/D/nb2Em16mt7/o0pcdq0O4yQ7UhrT8TTLKcZZst6si1k/JKvn
         OBZw4FrSBlDhL9J8j6M8QkHbgO7XEGfAFRCWsVq3P65u7vhACbJqoVjKEHhZYpX/tf+7
         rHFrRFIQTxnyC/Sxwen0prkfMdQNS2d+0ZH+5Jc7a/PR+d9J/Dla3iNITz/XQmExwG7l
         BqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XCI9g/rkpP6uZwbDhsFxs5VPwRnO+IbXPW64gxyIqQc=;
        b=NTAb13cCRP0+LZ5eFGTMOzcXLc1iycu/dcUDcIQZh09eEU5F25VR+3BguGDzZHrjUs
         YptOGXEEwn/n/AzJ8S2EEhakkbsgS4FNnJhmfBjMdzUgGhedYzW5Kk5Qb/Y7eMTM4Haf
         J/j+jCr4sdD8E9EUzqPFpz5hvDTp7D0Wf6yIvj4Qf5SyrIUdPIOn2mG0ZAJmIxG9xcoh
         PA1cOiyNCbnT2F5tnDu6YYgcw2SO1g1UK0ZK3zp2YN5HQdw9uhGTchsxd7keADA90HbK
         a6QVNxVj3aw6mpl0bPOZw7fFJhqD6Uuo4ZsbrW4HzKo601wCWOd/1aga2QcnnU37iUWd
         KGHQ==
X-Gm-Message-State: AOAM53392qtngByNI7tIExEpAXAyOT/MqFxTSRUVSsNToAch7CYK+iI3
	iB2DpQloU7QITpMAZ1Na/KpxCKeTcxJf57hHSUE=
X-Google-Smtp-Source: ABdhPJySaeBskLlSs4Ps+Lxirc3SUzS4avPCVlnRAAWKAJfeuAb37Ze3IsPLarrL0zEW+JHl8x5bnOoyCzCKkP302SM=
X-Received: by 2002:a05:6102:3a5a:: with SMTP id c26mr1695676vsu.20.1625907693149;
 Sat, 10 Jul 2021 02:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210709113146.69020-1-uvv.mail@gmail.com> <20210709113146.69020-7-uvv.mail@gmail.com>
In-Reply-To: <20210709113146.69020-7-uvv.mail@gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Sat, 10 Jul 2021 11:01:22 +0200
Message-ID: <CANNYZj9Ag=xhNBTt087OjjZkotfRy4ofqa3d0kTQz4RHc8wYJQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 7/8] oeqa/selftest: overlayfs unit tests
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: OE-core <Openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007ce01d05c6c12270"

--0000000000007ce01d05c6c12270
Content-Type: text/plain; charset="UTF-8"

Thank you for the patchset! These tests do not perform runtime testing of
the feature (by starting the built images with qemu), can this be added?
There is plenty of examples of how to do this in selftests (grep for
runqemu).

Alex

On Fri, 9 Jul 2021 at 13:33, Vyacheslav Yurkov <uvv.mail@gmail.com> wrote:

> Unit tests for overlayfs.bbclass
>
> Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> ---
>  meta/lib/oeqa/selftest/cases/overlayfs.py | 126 ++++++++++++++++++++++
>  1 file changed, 126 insertions(+)
>  create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py
>
> diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py
> b/meta/lib/oeqa/selftest/cases/overlayfs.py
> new file mode 100644
> index 0000000000..74bf1c4167
> --- /dev/null
> +++ b/meta/lib/oeqa/selftest/cases/overlayfs.py
> @@ -0,0 +1,126 @@
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +from oeqa.selftest.case import OESelftestTestCase
> +from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
> +
> +class OverlayFSTests(OESelftestTestCase):
> +    """Overlayfs class usage tests"""
> +
> +    def getline(self, res, line):
> +        for l in res.output.split('\n'):
> +            if line in l:
> +                return l
> +
> +    def test_distro_features_missing(self):
> +        """
> +        Summary:   Check that required DISTRO_FEATURES are set
> +        Expected:  Fail when either systemd or overlayfs are not in
> DISTRO_FEATURES
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +"""
> +        self.write_config(config)
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "overlayfs-user was skipped: missing
> required distro features")
> +        self.assertTrue("overlayfs" in res.output, msg=res.output)
> +        self.assertTrue("systemd" in res.output, msg=res.output)
> +        self.assertTrue("ERROR: Required build target
> 'core-image-minimal' has no buildable providers." in res.output,
> msg=res.output)
> +
> +    def test_not_all_units_installed(self):
> +        """
> +        Summary:   Test QA check that we have required mount units in the
> image
> +        Expected:  Fail because mount unit for overlay partition is not
> installed
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "Unit name mnt-overlay.mount not found
> in systemd unit directories")
> +        self.assertTrue(line and line.startswith("WARNING:"),
> msg=res.output)
> +        line = self.getline(res, "Not all mount units are installed by
> the BSP")
> +        self.assertTrue(line and line.startswith("ERROR:"),
> msg=res.output)
> +
> +    def test_mount_unit_not_set(self):
> +        """
> +        Summary:   Test whether mount unit was set properly
> +        Expected:  Fail because mount unit was not set
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "A recipe uses overlayfs class but there
> is no OVERLAYFS_MOUNT_POINT set in your MACHINE configuration")
> +        self.assertTrue(line and line.startswith("Parsing
> recipes...ERROR:"), msg=res.output)
> +
> +    def test_wrong_mount_unit_set(self):
> +        """
> +        Summary:   Test whether mount unit was set properly
> +        Expected:  Fail because not the correct flag used for mount unit
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +OVERLAYFS_MOUNT_POINT[usr-share-overlay] = "/usr/share/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +        self.write_config(config)
> +        res = bitbake('core-image-minimal', ignore_status=True)
> +        line = self.getline(res, "Missing required mount point for
> OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE configuration")
> +        self.assertTrue(line and line.startswith("Parsing
> recipes...ERROR:"), msg=res.output)
> +
> +    def test_correct_image(self):
> +        """
> +        Summary:   Check that we can create an image when all parameters
> are
> +                   set correctly
> +        Expected:  Image is created successfully
> +        Author:    Vyacheslav Yurkov <uvv.mail@gmail.com>
> +        """
> +
> +        config = """
> +OVERLAYFS_MOUNT_POINT[mnt-overlay] = "/mnt/overlay"
> +IMAGE_INSTALL_append = "overlayfs-user systemd-machine-units"
> +DISTRO_FEATURES += "systemd overlayfs"
> +"""
> +
> +        systemd_machine_unit_append = """
> +SYSTEMD_SERVICE_${PN} += " \
> +    mnt-overlay.mount \
> +"
> +
> +do_install() {
> +    install -d ${D}${systemd_unitdir}/system
> +    cat <<EOT > ${D}${systemd_unitdir}/system/mnt-overlay.mount
> +[Unit]
> +Description=Tmpfs directory
> +DefaultDependencies=no
> +
> +[Mount]
> +What=tmpfs
> +Where=/mnt/overlay
> +Type=tmpfs
> +Options=mode=1777,strictatime,nosuid,nodev
> +
> +[Install]
> +WantedBy=multi-user.target
> +EOT
> +}
> +
> +"""
> +        self.write_config(config)
> +        self.write_recipeinc('systemd-machine-units',
> systemd_machine_unit_append)
> +        bitbake('core-image-minimal')
> --
> 2.28.0
>
>
> 
>
>

--0000000000007ce01d05c6c12270
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thank you for the patchset! These tests do not perfor=
m runtime testing of the feature (by starting the built images with qemu), =
can this be added? There is plenty of examples of how to do this in selftes=
ts (grep for runqemu).</div><div><br></div><div>Alex<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, 9 Jul=
 2021 at 13:33, Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com"=
>uvv.mail@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Unit tests for overlayfs.bbclass<br>
<br>
Signed-off-by: Vyacheslav Yurkov &lt;<a href=3D"mailto:uvv.mail@gmail.com"=
 target=3D"_blank">uvv.mail@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/selftest/cases/overlayfs.py | 126 ++++++++++++++++++++=
++<br>
=C2=A01 file changed, 126 insertions(+)<br>
=C2=A0create mode 100644 meta/lib/oeqa/selftest/cases/overlayfs.py<br>
<br>
diff --git a/meta/lib/oeqa/selftest/cases/overlayfs.py b/meta/lib/oeqa/sel=
ftest/cases/overlayfs.py<br>
new file mode 100644<br>
index 0000000000..74bf1c4167<br>
--- /dev/null<br>
+++ b/meta/lib/oeqa/selftest/cases/overlayfs.py<br>
@@ -0,0 +1,126 @@<br>
+#<br>
+# SPDX-License-Identifier: MIT<br>
+#<br>
+<br>
+from oeqa.selftest.case import OESelftestTestCase<br>
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu<br>
+<br>
+class OverlayFSTests(OESelftestTestCase):<br>
+=C2=A0 =C2=A0 &quot;&quot;&quot;Overlayfs class usage tests&quot;&quot;&q=
uot;<br>
+<br>
+=C2=A0 =C2=A0 def getline(self, res, line):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for l in res.output.split(&#39;\n&#39;):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line in l:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return l<br>
+<br>
+=C2=A0 =C2=A0 def test_distro_features_missing(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Check that required DIST=
RO_FEATURES are set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Fail when either systemd or o=
verlayfs are not in DISTRO_FEATURES<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/overlay&quot;<br>
+IMAGE_INSTALL_append =3D &quot;overlayfs-user&quot;<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&#39;core-image-minimal&#39;,=
 ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D self.getline(res, &quot;overlayfs-us=
er was skipped: missing required distro features&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&quot;overlayfs&quot; in res.=
output, msg=3Dres.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&quot;systemd&quot; in res.ou=
tput, msg=3Dres.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(&quot;ERROR: Required build t=
arget &#39;core-image-minimal&#39; has no buildable providers.&quot; in res=
.output, msg=3Dres.output)<br>
+<br>
+=C2=A0 =C2=A0 def test_not_all_units_installed(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Test QA check that we ha=
ve required mount units in the image<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Fail because mount unit for o=
verlay partition is not installed<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/overlay&quot;<br>
+IMAGE_INSTALL_append =3D &quot;overlayfs-user&quot;<br>
+DISTRO_FEATURES +=3D &quot;systemd overlayfs&quot;<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&#39;core-image-minimal&#39;,=
 ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D self.getline(res, &quot;Unit name mn=
t-overlay.mount not found in systemd unit directories&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(line and line.startswith(&quo=
t;WARNING:&quot;), msg=3Dres.output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D self.getline(res, &quot;Not all moun=
t units are installed by the BSP&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(line and line.startswith(&quo=
t;ERROR:&quot;), msg=3Dres.output)<br>
+<br>
+=C2=A0 =C2=A0 def test_mount_unit_not_set(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Test whether mount unit =
was set properly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Fail because mount unit was n=
ot set<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+IMAGE_INSTALL_append =3D &quot;overlayfs-user&quot;<br>
+DISTRO_FEATURES +=3D &quot;systemd overlayfs&quot;<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&#39;core-image-minimal&#39;,=
 ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D self.getline(res, &quot;A recipe use=
s overlayfs class but there is no OVERLAYFS_MOUNT_POINT set in your MACHINE=
 configuration&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(line and line.startswith(&quo=
t;Parsing recipes...ERROR:&quot;), msg=3Dres.output)<br>
+<br>
+=C2=A0 =C2=A0 def test_wrong_mount_unit_set(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Test whether mount unit =
was set properly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Fail because not the correct =
flag used for mount unit<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+OVERLAYFS_MOUNT_POINT[usr-share-overlay] =3D &quot;/usr/share/overlay&quo=
t;<br>
+IMAGE_INSTALL_append =3D &quot;overlayfs-user&quot;<br>
+DISTRO_FEATURES +=3D &quot;systemd overlayfs&quot;<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 res =3D bitbake(&#39;core-image-minimal&#39;,=
 ignore_status=3DTrue)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 line =3D self.getline(res, &quot;Missing requ=
ired mount point for OVERLAYFS_MOUNT_POINT[mnt-overlay] in your MACHINE con=
figuration&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.assertTrue(line and line.startswith(&quo=
t;Parsing recipes...ERROR:&quot;), msg=3Dres.output)<br>
+<br>
+=C2=A0 =C2=A0 def test_correct_image(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Summary:=C2=A0 =C2=A0Check that we can create=
 an image when all parameters are<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0set =
correctly<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Expected:=C2=A0 Image is created successfully=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Author:=C2=A0 =C2=A0 Vyacheslav Yurkov &lt;<a=
 href=3D"mailto:uvv.mail@gmail.com" target=3D"_blank">uvv.mail@gmail.com</a=
>&gt;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 config =3D &quot;&quot;&quot;<br>
+OVERLAYFS_MOUNT_POINT[mnt-overlay] =3D &quot;/mnt/overlay&quot;<br>
+IMAGE_INSTALL_append =3D &quot;overlayfs-user systemd-machine-units&quot;=
<br>
+DISTRO_FEATURES +=3D &quot;systemd overlayfs&quot;<br>
+&quot;&quot;&quot;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 systemd_machine_unit_append =3D &quot;&quot;&=
quot;<br>
+SYSTEMD_SERVICE_${PN} +=3D &quot; \<br>
+=C2=A0 =C2=A0 mnt-overlay.mount \<br>
+&quot;<br>
+<br>
+do_install() {<br>
+=C2=A0 =C2=A0 install -d ${D}${systemd_unitdir}/system<br>
+=C2=A0 =C2=A0 cat &lt;&lt;EOT &gt; ${D}${systemd_unitdir}/system/mnt-over=
lay.mount<br>
+[Unit]<br>
+Description=3DTmpfs directory<br>
+DefaultDependencies=3Dno<br>
+<br>
+[Mount]<br>
+What=3Dtmpfs<br>
+Where=3D/mnt/overlay<br>
+Type=3Dtmpfs<br>
+Options=3Dmode=3D1777,strictatime,nosuid,nodev<br>
+<br>
+[Install]<br>
+WantedBy=3Dmulti-user.target<br>
+EOT<br>
+}<br>
+<br>
+&quot;&quot;&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_config(config)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.write_recipeinc(&#39;systemd-machine-uni=
ts&#39;, systemd_machine_unit_append)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bitbake(&#39;core-image-minimal&#39;)<br>
-- <br>
2.28.0<br>
<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000007ce01d05c6c12270--
