Return-Path: <lrannou@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6C65C7EE23
	for <webhook@archiver.kernel.org>; Wed,  7 Jun 2023 15:16:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.835.1686150971558048736
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jun 2023 08:16:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=fsVjQR69;
 spf=pass (domain: baylibre.com, ip: 209.85.221.41, mailfrom: lrannou@baylibre.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-30d181952a2so5432954f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 08:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686150970; x=1688742970;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CZW2t6soOqkPMbdq17dLAWec93+J3sCOBUuJBbxFWO4=;
        b=fsVjQR694z5I6xlQyn8lo6AJOHjhlTUwswOhDHfMsnPQDDiC7vW3ZMWcDRKxQp8vlP
         Jb2OvffLrJj9J0UsdcVy65sWu87GcumlxKUNQbYOxBWS68TrFgGS3wqdfpGyzK6UqenJ
         4I+L/d1lITvPSWzeiEFIBxYliKC/f3IQ3sJGGZHdmOuTd9dRf0WJF5b0olGqgUIn3z97
         SGznpZ8TNRfHTjYKzRHJCd2K9ikujbvTnt4DbDVl2+jxjjaCi/aLDcvlgjcwqyBL7LVp
         f001SloHhyc1ueTm3EeD3iilOYFH+dHBTdMXP5aI/TsEoYAmbKFm+l6Y1qlp+0ln2QWK
         qhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686150970; x=1688742970;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CZW2t6soOqkPMbdq17dLAWec93+J3sCOBUuJBbxFWO4=;
        b=DCmeVmbY4Opv5IGfL9Sy+dc7S5QF9K85PBDD0VqDewU01Qjazhs02DIipt2oeOhmnY
         O7RcO22u0ZiS4dnljq4BwHXLHKF2n1Dn2/ZaggCG+wjVAt9y3NoUiiALmh1SAe6sMPVz
         ic+OHTNUFbp+pcO1VcQ1THh0rp3h+qsJxOE8BLyCsPzO8xm0EBKpZ8lk6JcCukuvJWYB
         jkVg0p3pbKNCBNvjqM/LKTNi+09DF7mSlgQhXKPNT4r/7sDJmAIunafmeZC3zf5VQXiq
         B8RMMcfmQb43Ze4LEfqasasBwBV+kVK3D0Nm4WfZea7ns6rCu5A1Hvus0bV0V6ve4YZw
         id8A==
X-Gm-Message-State: AC+VfDyDm/PcHZmZ0FAL5E6tYOYRy3oc9xxqGDIJMRdLRSuVcPzYrznh
	BR+Jop+QAZy+RN4Td7YQu9Ob+g==
X-Google-Smtp-Source: ACHHUZ6h2IHvb7ugA5DXV7NVJFdn7C5QEXO4bDFAulwWGN6yvtH5sh/qwT8WE2M4UEyHisyfvNzkUA==
X-Received: by 2002:adf:f442:0:b0:2f6:ca0d:ec1c with SMTP id f2-20020adff442000000b002f6ca0dec1cmr4567566wrp.10.1686150969715;
        Wed, 07 Jun 2023 08:16:09 -0700 (PDT)
Received: from [172.30.105.10] (lmontsouris-658-1-109-35.w92-154.abo.wanadoo.fr. [92.154.6.35])
        by smtp.gmail.com with ESMTPSA id s2-20020a5d5102000000b0030ab5ebefa8sm15778865wrt.46.2023.06.07.08.16.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 08:16:09 -0700 (PDT)
Message-ID: <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
Date: Wed, 7 Jun 2023 17:16:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.1
Subject: Re: [RFC] incorrect parsing of sysusers.d in rootfs generation
Content-Language: en-US
From: Louis Rannou <lrannou@baylibre.com>
To: tgamblin@baylibre.com,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
In-Reply-To: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jun 2023 15:16:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182477

Hello again,

a python solution could be one below.

Also, I found that most of users/groups defined there are redundant as 
they already exist (such as root). I guess they are defined from 
base-passwd. I am not sure which recipe (base-passwd or systemd) should 
have the precedence on this. If it's base-passwd, perhaps this 
postcommand should check first if the user does already exist.

Regards,
Louis

---

  meta/classes/rootfs-postcommands.bbclass | 69 ++++++++++++++++--------
  1 file changed, 46 insertions(+), 23 deletions(-)

diff --git a/meta/classes/rootfs-postcommands.bbclass 
b/meta/classes/rootfs-postcommands.bbclass
index 5c0b3ec37c..1741919918 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -61,29 +61,52 @@ python () {
      d.appendVar('ROOTFS_POSTPROCESS_COMMAND', 'rootfs_reproducible;')
  }

-systemd_create_users () {
-	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/*.conf; do
-		[ -e $conffile ] || continue
-		grep -v "^#" $conffile | sed -e '/^$/d' | while read type name id 
comment; do
-		if [ "$type" = "u" ]; then
-			useradd_params="--shell /sbin/nologin"
-			[ "$id" != "-" ] && useradd_params="$useradd_params --uid $id"
-			[ "$comment" != "-" ] && useradd_params="$useradd_params --comment 
$comment"
-			useradd_params="$useradd_params --system $name"
-			eval useradd --root ${IMAGE_ROOTFS} $useradd_params || true
-		elif [ "$type" = "g" ]; then
-			groupadd_params=""
-			[ "$id" != "-" ] && groupadd_params="$groupadd_params --gid $id"
-			groupadd_params="$groupadd_params --system $name"
-			eval groupadd --root ${IMAGE_ROOTFS} $groupadd_params || true
-		elif [ "$type" = "m" ]; then
-			group=$id
-			eval groupadd --root ${IMAGE_ROOTFS} --system $group || true
-			eval useradd --root ${IMAGE_ROOTFS} --shell /sbin/nologin --system 
$name --no-user-group || true
-			eval usermod --root ${IMAGE_ROOTFS} -a -G $group $name
-		fi
-		done
-	done
+python systemd_create_users() {
+    import glob
+    import re
+    import subprocess
+
+    pattern_comment = r'(-|\"[^:\"]+\")'
+    pattern_word    = r'[^\s]+'
+    pattern_line   = r'(' + pattern_word + r')\s+(' + pattern_word + 
r')\s+(' + pattern_word + r')(\s+' \
+        + pattern_comment + r')?' + r'(\s+(' + pattern_word + r'))?' + 
r'(\s+(' + pattern_word + r'))?'
+
+    IMAGE_ROOTFS = d.getVar('IMAGE_ROOTFS')
+
+    for conffile in glob.glob(os.path.join(IMAGE_ROOTFS, 
'usr/lib/sysusers.d/*.conf')):
+        with open(conffile, 'r') as f:
+            for line in f:
+                line = line.strip()
+                if not len(line) or line[0] == '#': continue
+                ret = re.fullmatch(pattern_line, line.strip())
+                if not ret: continue
+                (stype, sname, sid, _, scomment, _, shomedir, _, 
sshell) = ret.groups()
+                if stype == 'u':
+                    useradd_command = ['useradd']
+                    if sid != '-':
+                        useradd_command.extend(['--uid', sid])
+                    if scomment and scomment != '-':
+                        useradd_command.extend(['--comment', scomment])
+                    if shomedir and shomedir != '-':
+                        useradd_command.extend(['--root', IMAGE_ROOTFS 
+ shomedir])
+                    else:
+                        useradd_command.extend(['--root', IMAGE_ROOTFS])
+                    if sshell and sshell != '-':
+                        useradd_command.extend(['--shell', sshell])
+                    else:
+                        useradd_command.extend(['--shell', 
'/sbin/nologin'])
+                    useradd_command.extend(['--system', sname])
+                    subprocess.run(useradd_command)
+                elif stype == 'g':
+                    groupadd_command = ['groupadd']
+                    if sid != '-':
+                        groupadd_command.extend(['--gid', sid])
+                    groupadd_command.extend(['--system', sname])
+                    subprocess.run(groupadd_command)
+                elif stype == 'm':
+                    subprocess.run(['groupadd', '--root', IMAGE_ROOTFS, 
'--system', sid])
+                    subprocess.run(['useradd', '--root', IMAGE_ROOTFS, 
'--shell', '/sbin/nologin', '--system', name, 'no-user-group'])
+                    subprocess.run(['usermod', '-a', '-G', sid, sname])
  }

  #



On 05/06/2023 17:55, Louis Rannou wrote:> Hello,
 >
 > I have found an issue in the rootfs routine. The
 > rootfs-postcommands.bbclass has a funtion systemd_create_users that
 > reads /etc/sysusers.d/*.conf files and parses lines as 'type name id
 > comment'.
 >
 > However, the sysusers.d manual says, those lines can be 'type name id
 > comment home_dir shell'. If a home directory of shell is defined, they
 > are considered as part of the comment, and we run incorrect commands
 > such as the one below :
 >
 > useradd --shell /sbin/nologin --uid 0 --comment "Super User" /root
 > --system root
 >
 > To fix that, we require a stronger parsing. Several options look
 > possible to me, but I am not sure which one is preferred.
 >
 > 1. sed with a regular expression that returns something that still needs
 > parsing
 > 2. awk with a step by step script that returns something that still
 > needs to be parsed
 > 3. use python and regexp module
 >
 > Also I don't know if the parsing should completely check the sysusers
 > syntax as said in the manual (first field is [urgm], second is
 > alphanum_-, etc.). In my opinion it should not as this will be made by
 > the useradd command.
 >
 > Do you think it worth to add some testing about that ? I am not sure how
 > to do that.
 >
 > Regards,
 > Louis Rannou

