Return-Path: <andrew.j.oppelt@boeing.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6B3C52D7B
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 22:08:16 +0000 (UTC)
Received: from clt-mbsout-01.mbs.boeing.net (clt-mbsout-01.mbs.boeing.net [130.76.144.162])
 by mx.groups.io with SMTP id smtpd.web10.84552.1723586890282419273
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 15:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@boeing.com header.s=boeing-s1912 header.b=ZpCBPsJ/;
 spf=pass (domain: boeing.com, ip: 130.76.144.162, mailfrom: andrew.j.oppelt@boeing.com)
Received: from localhost (localhost [127.0.0.1])
	by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_MBSOUT) with SMTP id 47DM87x4006296;
	Tue, 13 Aug 2024 18:08:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=boeing.com;
	s=boeing-s1912; t=1723586889;
	bh=EXCQqtm2eqOtk5o1zmzisTPbNIDhiVvnahaiMsgF8+c=;
	h=From:To:Cc:Subject:Date:From;
	b=ZpCBPsJ/uQXT6QGUx6bvaewpXVyeR+1LLYw5PLvDMebvPk9j0Bl3LmI/rCoTCTbRU
	 bWc+yzSNiOsrwvJnOBLgv4SNx1ZzXTQ0u7/6ydlv1ASm1fioT4+YP7v/f0B9SUw0g2
	 Hkq28UHfE2u7/g90xxTE5v9abS4AFoO99nwHnSQhDdnjurambj0EcDTAtKuT7lNiuj
	 +pF2ke+/p9sHIfUbaiiLufWLLRPbEH7WvarrM7+yPOxM/CIoix9vIWGFYS90dzIOE+
	 VnMO3GJ5VwG8KpYlEGCMG+EDBT8R0s75mnctvvo3s40f6/TCVTmHKZAO/XU/cL9C0J
	 5Fj7s5/Jy9asQ==
Received: from phx-av-01.mbs.boeing.net (phx-av-01.mbs.boeing.net [137.136.102.153])
	by clt-mbsout-01.mbs.boeing.net (8.15.2/8.15.2/8.15.2/UPSTREAM_MBSOUT) with ESMTPS id 47DM854b006274
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 18:08:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/DOWNSTREAM_RELAY) with SMTP id 47DM84Pe022560;
	Tue, 13 Aug 2024 15:08:04 -0700
Received: from onsbuild1.cbb.boeing.com (onsbuild1.cbb.boeing.com [132.224.17.88])
	by phx-av-01.mbs.boeing.net (8.15.2/8.15.2/UPSTREAM_RELAY) with ESMTP id 47DM7vvY022312;
	Tue, 13 Aug 2024 15:07:57 -0700
From: Andrew Oppelt <andrew.j.oppelt@boeing.com>
To: openembedded-core@lists.openembedded.org
Cc: Andrew Oppelt <andrew.j.oppelt@boeing.com>,
        Matthew Weber <matthew.l.weber3@boeing.com>,
        Chuck Wolber <chuck.wolber@boeing.com>
Subject: [PATCH v2] testexport: support for executing tests over serial
Date: Tue, 13 Aug 2024 15:07:49 -0700
Message-Id: <1723586869-2295-1-git-send-email-andrew.j.oppelt@boeing.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by clt-mbsout-01.mbs.boeing.net id 47DM87x4006296
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 22:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203298

Uses TEST_SERIALCONTROL_CMD to open a serial connection to the target
and execute commands. This is a drop in replacement for the ssh target,
fully supporting the same API. Supported with testexport.

To use, set the following in local.conf:
- TEST_TARGET to "serial"
- TEST_SERIALCONTROL_CMD to a shell command or script which connects to
  the serial console of the target and forwards that connection to
  standard input/output.
- TEST_SERIALCONTROL_EXTRA_ARGS (optional) any parameters that must be
  passed to the serial control command.
- TEST_SERIALCONTROL_PS1 (optional) A regex string representing an empty
  prompt on the target terminal. Example: "root@target:.*# ". This is
  used to find an empty shell after each command is run. This field is
  optional and will default to "root@{MACHINE}:.*# " if no other value is
  given.
- TEST_SERIALCONTROL_CONNECT_TIMEOUT (optional) Specifies the timeout in
  seconds for the initial connection to the target. Defaults to 10 if no
  other value is given.

The serial target does have some additional limitations over the ssh
target.
1. Only supports one "run" command at a time. If two threads attempt to
   call "run", one will block until it finishes. This is a limitation of
   the serial link, since two connections cannot be opened at once.
2. For file transfer, the target needs a shell and the base32 program.
   The file transfer implementation was chosen to be as generic as
   possible, so it could support as many targets as possible.
3. Transferring files is significantly slower. On a 115200 baud serial
   connection, the fastest observed speed was 30kbps. This is due to
   overhead in the implementation due to decisions documented in #2
   above.

Signed-off-by: Andrew Oppelt <andrew.j.oppelt@boeing.com>
Signed-off-by: Matthew Weber <matthew.l.weber3@boeing.com>
Signed-off-by: Chuck Wolber <chuck.wolber@boeing.com>

--

Tested with core-image-sato on real hardware. TEST_SERIALCONTROL_CMD
was set to a bash script which connected with telnet to the target.

Additionally tested with QEMU by setting TEST_SERIALCONTROL_CMD to
"ssh -o StrictHostKeyChecking=3Dno root@192.168.7.2". This imitates
a serial connection to the QEMU instance.

Steps:
1) Set the following in local.conf:
  - IMAGE_CLASSES +=3D "testexport"
  - TEST_TARGET =3D "serial"
  - TEST_SERIALCONTROL_CMD=3D"ssh -o StrictHostKeyChecking=3Dno root@192.=
168.7.2"
2) Build an image
  - bitbake core-image-sato
3) Run the test export
  - bitbake -c testexport core-image-sato
4) Run the image in qemu
  - runqemu nographic core-image-sato
5) Navigate to the test export directory
6) Run the exported tests with target-type set to serial
 - ./oe-test runtime --test-data-file ./data/testdata.json --packages-man=
ifest ./data/manifest --debug --target-type serial
---
 meta/classes-recipe/testexport.bbclass |   9 +-
 meta/classes-recipe/testimage.bbclass  |   2 +
 meta/conf/documentation.conf           |   2 +
 meta/lib/oeqa/core/target/serial.py    | 315 +++++++++++++++++++++++++
 meta/lib/oeqa/runtime/context.py       |  12 +-
 5 files changed, 338 insertions(+), 2 deletions(-)
 create mode 100644 meta/lib/oeqa/core/target/serial.py

diff --git a/meta/classes-recipe/testexport.bbclass b/meta/classes-recipe=
/testexport.bbclass
index 57f7f15885..76db4c625f 100644
--- a/meta/classes-recipe/testexport.bbclass
+++ b/meta/classes-recipe/testexport.bbclass
@@ -57,9 +57,16 @@ def testexport_main(d):
=20
     logger =3D logging.getLogger("BitBake")
=20
+    target_kwargs =3D { }
+    target_kwargs['machine'] =3D d.getVar("MACHINE") or None
+    target_kwargs['serialcontrol_cmd'] =3D d.getVar("TEST_SERIALCONTROL_=
CMD") or None
+    target_kwargs['serialcontrol_extra_args'] =3D d.getVar("TEST_SERIALC=
ONTROL_EXTRA_ARGS") or ""
+    target_kwargs['serialcontrol_ps1'] =3D d.getVar("TEST_SERIALCONTROL_=
PS1") or None
+    target_kwargs['serialcontrol_connect_timeout'] =3D d.getVar("TEST_SE=
RIALCONTROL_CONNECT_TIMEOUT") or None
+
     target =3D OERuntimeTestContextExecutor.getTarget(
         d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
-        d.getVar("TEST_SERVER_IP"))
+        d.getVar("TEST_SERVER_IP"), **target_kwargs)
=20
     image_manifest =3D "%s.manifest" % image_name
     image_packages =3D OERuntimeTestContextExecutor.readPackagesManifest=
(image_manifest)
diff --git a/meta/classes-recipe/testimage.bbclass b/meta/classes-recipe/=
testimage.bbclass
index 6d1e1a107a..19075ce1f3 100644
--- a/meta/classes-recipe/testimage.bbclass
+++ b/meta/classes-recipe/testimage.bbclass
@@ -239,6 +239,8 @@ def testimage_main(d):
             bb.fatal('Unsupported image type built. Add a compatible ima=
ge to '
                      'IMAGE_FSTYPES. Supported types: %s' %
                      ', '.join(supported_fstypes))
+    elif d.getVar("TEST_TARGET") =3D=3D "serial":
+        bb.fatal('Serial target is currently only supported in testexpor=
t.')
     qfstype =3D fstypes[0]
     qdeffstype =3D d.getVar("QB_DEFAULT_FSTYPE")
     if qdeffstype:
diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
index e912e91265..3f130120c0 100644
--- a/meta/conf/documentation.conf
+++ b/meta/conf/documentation.conf
@@ -429,7 +429,9 @@ TEST_SUITES[doc] =3D "An ordered list of tests (modul=
es) to run against an image w
 TEST_POWERCONTROL_CMD[doc] =3D "For automated hardware testing, specifie=
s the command to use to control the power of the target machine under tes=
t"
 TEST_POWERCONTROL_EXTRA_ARGS[doc] =3D "For automated hardware testing, s=
pecifies additional arguments to pass through to the command specified in=
 TEST_POWERCONTROL_CMD"
 TEST_SERIALCONTROL_CMD[doc] =3D "For automated hardware testing, specifi=
es the command to use to connect to the serial console of the target mach=
ine under test"
+TEST_SERIALCONTROL_CONNECT_TIMEOUT[doc] =3D "For automated hardware test=
ing, specifies the timeout in seconds for the initial connection to the t=
arget. Defaults to '10'."
 TEST_SERIALCONTROL_EXTRA_ARGS[doc] =3D "For automated hardware testing, =
specifies additional arguments to pass through to the command specified i=
n TEST_SERIALCONTROL_CMD"
+TEST_SERIALCONTROL_PS1[doc] =3D "For automated hardware testing, specifi=
es a regex string representing an empty prompt on the target terminal. Ex=
ample: 'root@target:.*#'. Defaults to 'root@${MACHINE}:.*#'."
 TEST_TARGET[doc] =3D "For automated runtime testing, specifies the metho=
d of deploying the image and running tests on the target machine"
 THISDIR[doc] =3D "The directory in which the file BitBake is currently p=
arsing is located."
 TIME[doc] =3D "The time the build was started using HMS format."
diff --git a/meta/lib/oeqa/core/target/serial.py b/meta/lib/oeqa/core/tar=
get/serial.py
new file mode 100644
index 0000000000..7c2cd8b248
--- /dev/null
+++ b/meta/lib/oeqa/core/target/serial.py
@@ -0,0 +1,315 @@
+#
+# SPDX-License-Identifier: MIT
+#
+
+import base64
+import logging
+import os
+from threading import Lock
+from . import OETarget
+
+class OESerialTarget(OETarget):
+
+    def __init__(self, logger, target_ip, server_ip, server_port=3D0,
+                 timeout=3D300, serialcontrol_cmd=3DNone, serialcontrol_=
extra_args=3DNone,
+                 serialcontrol_ps1=3DNone, serialcontrol_connect_timeout=
=3DNone,=20
+                 machine=3DNone, **kwargs):
+        if not logger:
+            logger =3D logging.getLogger('target')
+            logger.setLevel(logging.INFO)
+            filePath =3D os.path.join(os.getcwd(), 'remoteTarget.log')
+            fileHandler =3D logging.FileHandler(filePath, 'w', 'utf-8')
+            formatter =3D logging.Formatter(
+                        '%(asctime)s.%(msecs)03d %(levelname)s: %(messag=
e)s',
+                        '%H:%M:%S')
+            fileHandler.setFormatter(formatter)
+            logger.addHandler(fileHandler)
+
+        super(OESerialTarget, self).__init__(logger)
+
+        if serialcontrol_ps1:
+            self.target_ps1 =3D serialcontrol_ps1
+        elif machine:
+            # fallback to a default value which assumes root@machine
+            self.target_ps1 =3D f'root@{machine}:.*# '
+        else:
+            raise ValueError("Unable to determine shell command prompt (=
PS1) format.")
+
+        if not serialcontrol_cmd:
+            raise ValueError("Unable to determine serial control command=
.")
+
+        if serialcontrol_extra_args:
+            self.connection_script =3D f'{serialcontrol_cmd} {serialcont=
rol_extra_args}'
+        else:
+            self.connection_script =3D serialcontrol_cmd
+
+        if serialcontrol_connect_timeout:
+            self.connect_timeout =3D serialcontrol_connect_timeout
+        else:
+            self.connect_timeout =3D 10 # default to 10s connection time=
out
+
+        self.default_command_timeout =3D timeout
+        self.ip =3D target_ip
+        self.server_ip =3D server_ip
+        self.server_port =3D server_port=20
+        self.conn =3D None
+        self.mutex =3D Lock()
+
+    def start(self, **kwargs):
+        pass
+
+    def stop(self, **kwargs):
+        pass
+
+    def get_connection(self):
+        if self.conn is None:
+            self.conn =3D SerialConnection(self.connection_script,
+                                         self.target_ps1,
+                                         self.connect_timeout,
+                                         self.default_command_timeout)
+
+        return self.conn
+
+    def run(self, cmd, timeout=3DNone):
+        """
+            Runs command on target over the provided serial connection.
+            The first call will open the connection, and subsequent
+            calls will re-use the same connection to send new commands.
+
+            command:    Command to run on target.
+            timeout:    <value>:    Kill command after <val> seconds.
+                        None:       Kill command default value seconds.
+                        0:          No timeout, runs until return.
+        """
+        # Lock needed to avoid multiple threads running commands concurr=
ently
+        # A serial connection can only be used by one caller at a time
+        with self.mutex:
+            conn =3D self.get_connection()
+
+            self.logger.debug(f"[Running]$ {cmd}")
+            # Run the command, then echo $? to get the command's return =
code
+            try:
+                output =3D conn.run_command(cmd, timeout)
+                status =3D conn.run_command("echo $?")
+                self.logger.debug(f"   [stdout]: {output}")
+                self.logger.debug(f"   [ret code]: {status}\n\n")
+            except SerialTimeoutException as e:
+                self.logger.debug(e)
+                output =3D ""
+                status =3D 255
+
+            # Return to $HOME after each command to simulate a stateless=
 SSH connection
+            conn.run_command('cd "$HOME"')
+
+        return (int(status), output)
+
+    def copyTo(self, localSrc, remoteDst):
+        """
+            Copies files by converting them to base 32, then transferrin=
g
+            the ASCII text to the target, and decoding it in place on th=
e
+            target.
+
+            On a 115k baud serial connection, this method transfers at
+            roughly 30kbps.
+        """
+        with open(localSrc, 'rb') as file:
+            data =3D file.read()
+
+        b32 =3D base64.b32encode(data).decode('utf-8')
+
+        # To avoid shell line limits, send a chunk at a time
+        SPLIT_LEN =3D 512=20
+        lines =3D [b32[i:i+SPLIT_LEN] for i in range(0, len(b32), SPLIT_=
LEN)]
+
+        with self.mutex:
+            conn =3D self.get_connection()
+
+            filename =3D os.path.basename(localSrc)
+            TEMP =3D f'/tmp/{filename}.b32'
+
+            # Create or empty out the temp file
+            conn.run_command(f'echo -n "" > {TEMP}')
+
+            for line in lines:
+                conn.run_command(f'echo -n {line} >> {TEMP}')
+
+            # Check to see whether the remoteDst is a directory
+            is_directory =3D conn.run_command(f'[[ -d {remoteDst} ]]; ec=
ho $?')
+            if int(is_directory) =3D=3D 0:
+                # append the localSrc filename to the end of remoteDst
+                remoteDst =3D os.path.join(remoteDst, filename)
+
+            conn.run_command(f'base32 -d {TEMP} > {remoteDst}')
+            conn.run_command(f'rm {TEMP}')
+
+        return 0, 'Success'
+
+    def copyFrom(self, remoteSrc, localDst):
+        """
+            Copies files by converting them to base 32 on the target, th=
en
+            transferring the ASCII text to the host. That text is then
+            decoded here and written out to the destination.
+
+            On a 115k baud serial connection, this method transfers at
+            roughly 30kbps.
+        """
+        with self.mutex:
+            b32 =3D self.get_connection().run_command(f'base32 {remoteSr=
c}')
+
+            data =3D base64.b32decode(b32.replace('\r\n', ''))
+
+            # If the local path is a directory, get the filename from
+            # the remoteSrc path and append it to localDst
+            if os.path.isdir(localDst):
+                filename =3D os.path.basename(remoteSrc)
+                localDst =3D os.path.join(localDst, filename)
+
+            with open(localDst, 'wb') as file:
+                file.write(data)
+
+        return 0, 'Success'
+
+    def copyDirTo(self, localSrc, remoteDst):
+        """
+            Copy recursively localSrc directory to remoteDst in target.
+        """
+
+        for root, dirs, files in os.walk(localSrc):
+            # Create directories in the target as needed
+            for d in dirs:
+                tmpDir =3D os.path.join(root, d).replace(localSrc, "")
+                newDir =3D os.path.join(remoteDst, tmpDir.lstrip("/"))
+                cmd =3D "mkdir -p %s" % newDir
+                self.run(cmd)
+
+            # Copy files into the target
+            for f in files:
+                tmpFile =3D os.path.join(root, f).replace(localSrc, "")
+                dstFile =3D os.path.join(remoteDst, tmpFile.lstrip("/"))
+                srcFile =3D os.path.join(root, f)
+                self.copyTo(srcFile, dstFile)
+
+    def deleteFiles(self, remotePath, files):
+        """
+            Deletes files in target's remotePath.
+        """
+
+        cmd =3D "rm"
+        if not isinstance(files, list):
+            files =3D [files]
+
+        for f in files:
+            cmd =3D "%s %s" % (cmd, os.path.join(remotePath, f))
+
+        self.run(cmd)
+
+    def deleteDir(self, remotePath):
+        """
+            Deletes target's remotePath directory.
+        """
+
+        cmd =3D "rmdir %s" % remotePath
+        self.run(cmd)
+
+    def deleteDirStructure(self, localPath, remotePath):
+        """
+        Delete recursively localPath structure directory in target's rem=
otePath.
+
+        This function is useful to delete a package that is installed in=
 the
+        device under test (DUT) and the host running the test has such p=
ackage
+        extracted in tmp directory.
+
+        Example:
+            pwd: /home/user/tmp
+            tree:   .
+                    =E2=94=94=E2=94=80=E2=94=80 work
+                        =E2=94=9C=E2=94=80=E2=94=80 dir1
+                        =E2=94=82=C2=A0=C2=A0 =E2=94=94=E2=94=80=E2=94=80=
 file1
+                        =E2=94=94=E2=94=80=E2=94=80 dir2
+
+            localpath =3D "/home/user/tmp" and remotepath =3D "/home/use=
r"
+
+            With the above variables this function will try to delete th=
e
+            directory in the DUT in this order:
+                /home/user/work/dir1/file1
+                /home/user/work/dir1        (if dir is empty)
+                /home/user/work/dir2        (if dir is empty)
+                /home/user/work             (if dir is empty)
+        """
+
+        for root, dirs, files in os.walk(localPath, topdown=3DFalse):
+            # Delete files first
+            tmpDir =3D os.path.join(root).replace(localPath, "")
+            remoteDir =3D os.path.join(remotePath, tmpDir.lstrip("/"))
+            self.deleteFiles(remoteDir, files)
+
+            # Remove dirs if empty
+            for d in dirs:
+                tmpDir =3D os.path.join(root, d).replace(localPath, "")
+                remoteDir =3D os.path.join(remotePath, tmpDir.lstrip("/"=
))
+                self.deleteDir(remoteDir)
+
+class SerialTimeoutException(Exception):
+    def __init__(self, msg):
+        self.msg =3D msg
+    def __str__(self):
+        return self.msg
+
+class SerialConnection:
+
+    def __init__(self, script, target_prompt, connect_timeout, default_c=
ommand_timeout):
+        import pexpect # limiting scope to avoid build dependency
+        self.prompt =3D target_prompt
+        self.connect_timeout =3D connect_timeout
+        self.default_command_timeout =3D default_command_timeout
+        self.conn =3D pexpect.spawn('/bin/bash', ['-c', script], encodin=
g=3D'utf8')
+        self._seek_to_clean_shell()
+        # Disable echo to avoid the need to parse the outgoing command
+        self.run_command('stty -echo')
+
+    def _seek_to_clean_shell(self):
+        """
+            Attempts to find a clean shell, meaning it is clear and
+            ready to accept a new command. This is necessary to ensure
+            the correct output is captured from each command.
+        """
+        import pexpect # limiting scope to avoid build dependency
+        # Look for a clean shell
+        # Wait a short amount of time for the connection to finish
+        pexpect_code =3D self.conn.expect([self.prompt, pexpect.TIMEOUT]=
,
+                                        timeout=3Dself.connect_timeout)
+
+        # if a timeout occurred, send an empty line and wait for a clean=
 shell
+        if pexpect_code =3D=3D 1:
+            # send a newline to clear and present the shell
+            self.conn.sendline("")
+            pexpect_code =3D self.conn.expect(self.prompt)
+
+    def run_command(self, cmd, timeout=3DNone):
+        """
+            Runs command on target over the provided serial connection.
+            Returns any output on the shell while the command was run.
+
+            command:    Command to run on target.
+            timeout:    <value>:    Kill command after <val> seconds.
+                        None:       Kill command default value seconds.
+                        0:          No timeout, runs until return.
+        """
+        import pexpect # limiting scope to avoid build dependency
+        # Convert from the OETarget defaults to pexpect timeout values
+        if timeout is None:
+            timeout =3D self.default_command_timeout
+        elif timeout =3D=3D 0:
+            timeout =3D None # passing None to pexpect is infinite timeo=
ut
+
+        self.conn.sendline(cmd)
+        pexpect_code =3D self.conn.expect([self.prompt, pexpect.TIMEOUT]=
, timeout=3Dtimeout)
+
+        # check for timeout
+        if pexpect_code =3D=3D 1:
+            self.conn.send('\003') # send Ctrl+C
+            self._seek_to_clean_shell()
+            raise SerialTimeoutException(f'Timeout executing: {cmd} afte=
r {timeout}s')
+
+        return self.conn.before.removesuffix('\r\n')
+
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/con=
text.py
index cb7227a8df..daabc44910 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -8,6 +8,7 @@ import os
 import sys
=20
 from oeqa.core.context import OETestContext, OETestContextExecutor
+from oeqa.core.target.serial import OESerialTarget
 from oeqa.core.target.ssh import OESSHTarget
 from oeqa.core.target.qemu import OEQemuTarget
=20
@@ -60,7 +61,7 @@ class OERuntimeTestContextExecutor(OETestContextExecuto=
r):
         runtime_group =3D self.parser.add_argument_group('runtime option=
s')
=20
         runtime_group.add_argument('--target-type', action=3D'store',
-                default=3Dself.default_target_type, choices=3D['simplere=
mote', 'qemu'],
+                default=3Dself.default_target_type, choices=3D['simplere=
mote', 'qemu', 'serial'],
                 help=3D"Target type of device under test, default: %s" \
                 % self.default_target_type)
         runtime_group.add_argument('--target-ip', action=3D'store',
@@ -108,6 +109,8 @@ class OERuntimeTestContextExecutor(OETestContextExecu=
tor):
             target =3D OESSHTarget(logger, target_ip, server_ip, **kwarg=
s)
         elif target_type =3D=3D 'qemu':
             target =3D OEQemuTarget(logger, server_ip, **kwargs)
+        elif target_type =3D=3D 'serial':
+            target =3D OESerialTarget(logger, target_ip, server_ip, **kw=
args)
         else:
             # XXX: This code uses the old naming convention for controll=
ers and
             # targets, the idea it is to leave just targets as the contr=
oller
@@ -203,8 +206,15 @@ class OERuntimeTestContextExecutor(OETestContextExec=
utor):
=20
         super(OERuntimeTestContextExecutor, self)._process_args(logger, =
args)
=20
+        td =3D self.tc_kwargs['init']['td']
+
         target_kwargs =3D {}
+        target_kwargs['machine'] =3D td.get("MACHINE") or None
         target_kwargs['qemuboot'] =3D args.qemu_boot
+        target_kwargs['serialcontrol_cmd'] =3D td.get("TEST_SERIALCONTRO=
L_CMD") or None
+        target_kwargs['serialcontrol_extra_args'] =3D td.get("TEST_SERIA=
LCONTROL_EXTRA_ARGS") or ""
+        target_kwargs['serialcontrol_ps1'] =3D td.get("TEST_SERIALCONTRO=
L_PS1") or None
+        target_kwargs['serialcontrol_connect_timeout'] =3D td.get("TEST_=
SERIALCONTROL_CONNECT_TIMEOUT") or None
=20
         self.tc_kwargs['init']['target'] =3D \
                 OERuntimeTestContextExecutor.getTarget(args.target_type,
--=20
2.43.5


