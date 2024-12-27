Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ECA6E7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 18:53:22 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.17636.1735325594593756460
 for <openembedded-core@lists.openembedded.org>;
 Fri, 27 Dec 2024 10:53:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=InOWWB3T;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6dd43aa1558so36203356d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 10:53:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735325593; x=1735930393; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2TJUsQHRmzIAUFMjRwghdCCij3aLTmylSEIyfKCOl0I=;
        b=InOWWB3TzANjr1mKiEKWBYFbaNEjKTDkBPiEmnPMd87F0fznGu5+ihZ+BCGzTr3RhB
         jZonEQZ3yqzm75kAYj6qSMgXdMxS+YXttA6GkOv2zlOIMyDYpdQHQ2sl9D+hi+xihd94
         S8HFLbSNa4HrylUSnWZxwlI6fs0mC7wcQxWhS1yvBde8d7o5+qd/DkgXq0UeFKKc7JQL
         xzP/64oneRbwFDZ4SbdG8wvJseknNJiIc3z2lUJfne6tG+xFgfrOn1MB5HqVh1akccoE
         IAMjfd3VpExqbLT/chGNF7xclHvHzha+ZQnbYPTZyH//8gjy+2JZxBpejX6SHTW2MXq2
         W9rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735325593; x=1735930393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TJUsQHRmzIAUFMjRwghdCCij3aLTmylSEIyfKCOl0I=;
        b=iBqT69vh34z/Zh6CpWS/YRlpqG9HMUgE0aQWm/ZCOdBNMT+SqW9MQrxW4SmMA4QDgN
         csKU6VG/iPAwzO2vkl6X/KomdElJ3P3a8xlS6mPIXL7dihpl6nbDTkiPgHVtxDOcw3ge
         QhJ7MU5ufYs6YCWV+SAoGEV4XGoUpEmL++7YfXxICMcXWkBJPCr43iJf09K43HXkep8S
         z1KOPrdgePVAawVV2VpUFTW/GhojZpgbOAU+x0Q6cTlq/FrQYwlNoZ1gmEEZ2uyn0GCn
         1D46ns+kvnSfQnjXJPfeYqPZcP3D5D4JTbCfWTIhfQF/JLuI38ezpITFeIZFf1sjn0dN
         /nfw==
X-Gm-Message-State: AOJu0YzExWQ7D+nv6eZeuBCwWYQyTtC0nQN7OyX2ayYNAQrLT5pH/kjb
	ihnfOeIq47Pss+Vgy0z9Nk6k0jG3PvCtlgNUdV2EFBCBX+XSn46PHut9tiFVyoZwceoI91OniX8
	FdF9PJRNg7bXw0WWU7LFpESwvLAYA0w==
X-Gm-Gg: ASbGncsrte6aJIEfSZ2b2hJoNxl4uC8wm0P14wMvjPFLJTUklHB9Qsdkqutu4qD7ha0
	MXtSaXckMreA0ap2o272DK6icijddLx9ayqX2XGWBjr9nCxHqGY3DPkeefM3Ctz23LI0GV3Fc
X-Google-Smtp-Source: AGHT+IGxnXCUvfnjyekd6ihLI+SV4kk4znAxIIMDBVnYIriVag1xGo3k9reP6/78heOGDLSLJ10hi0omYiPWn47ftjw=
X-Received: by 2002:a05:6214:e48:b0:6d8:95c9:af2b with SMTP id
 6a1803df08f44-6dd2339ff71mr405692336d6.35.1735325593495; Fri, 27 Dec 2024
 10:53:13 -0800 (PST)
MIME-Version: 1.0
References: <20241227065337.1257972-1-Deepesh.Varatharajan@windriver.com> <20241227065337.1257972-3-Deepesh.Varatharajan@windriver.com>
In-Reply-To: <20241227065337.1257972-3-Deepesh.Varatharajan@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 27 Dec 2024 19:53:02 +0100
Message-ID: <CANNYZj9tGwHLjJio-LJU9G-DKkQufewk_W35EJsMbnUYgPScSg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/3] rust: Upgrade 1.80.1->1.81.0
To: deepesh.varatharajan@windriver.com
Cc: openembedded-core@lists.openembedded.org, 
	Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 27 Dec 2024 18:53:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209109

On Fri, 27 Dec 2024 at 07:54, Varatharajan, Deepesh via
lists.openembedded.org
<deepesh.varatharajan=windriver.com@lists.openembedded.org> wrote:
> https://blog.rust-lang.org/2024/09/05/Rust-1.81.0.html
>
> Dropped:
> 0001-cargo-do-not-write-host-information-into-compilation.patch
> hardcodepaths.patch

You need to explain why the patches have been dropped, as they're both
marked 'Inappropriate'.

Have the issues been fixed upstream? How and where? Can you include
the pointers to the fixes?


> +diff --git a/vendor/cc-1.0.99/src/command_helpers.rs b/vendor/cc-1.0.99/src/command_helpers.rs
> +index fe919a5239..2b1f442019 100644
> +--- a/vendor/cc-1.0.99/src/command_helpers.rs
> ++++ b/vendor/cc-1.0.99/src/command_helpers.rs
> +@@ -257,6 +257,7 @@ fn wait_on_child(
> + /// and store them in the output Object.
> + pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Result<Vec<Object>, Error> {
> +     let mut objects = Vec::with_capacity(files.len());
> ++    let target_substring = ["rustc"];
> +     for file in files {
> +         let basename = file
> +             .file_name()
> +@@ -277,10 +278,29 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>], dst: &Path) -> Result<Vec<
> +             })?
> +             .to_string_lossy();
> +
> ++        // Function to find the position of the first occurrence of the target substring
> ++        fn find_target_position(s: &str, targets: &[&str]) -> Option<usize> {
> ++            let mut pos = None;
> ++            for target in targets {
> ++                if let Some(index) = s.rfind(target) {
> ++                    //If a target is found and pos is None, set it
> ++                        if pos.is_none() || index < pos.unwrap() {
> ++                            pos = Some(index);
> ++                        }
> ++                }
> ++            }
> ++            pos
> ++        }
> ++
> ++        let filtered_dirname = if let Some(pos) = find_target_position(&dirname, &target_substring) {
> ++            dirname[pos..].to_string()  //Keep everything from the target substring onwards
> ++        }  else {
> ++            dirname.to_string()  //If target substring is not found, keep the original dirname
> ++        };
> +         // Hash the dirname. This should prevent conflicts if we have multiple
> +         // object files with the same filename in different subfolders.
> +         let mut hasher = hash_map::DefaultHasher::new();
> +-        hasher.write(dirname.to_string().as_bytes());
> ++        hasher.write(filtered_dirname.as_bytes());
> +         let obj = dst
> +             .join(format!("{:016x}-{}", hasher.finish(), basename))
> +             .with_extension("o");

Similarly, why this patch has this new addition? Is there an upstream
discussion related to it somewhere, or is it just multiple versions of
the same crate all needing the same fix?

Alex

