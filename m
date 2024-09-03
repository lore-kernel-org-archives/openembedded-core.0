Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18E88CA101E
	for <webhook@archiver.kernel.org>; Tue,  3 Sep 2024 04:40:37 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web11.16047.1725338424936390703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Sep 2024 21:40:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R9SKoO2d;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-26fda13f898so2846143fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Sep 2024 21:40:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725338424; x=1725943224; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cdnj9Zz3hw6z4FvXFHwiMTxGt0Sxrpw5JUwKvvnheYQ=;
        b=R9SKoO2dEXkulocckeDBXBzJXWFjHAY6v4DxAQFiNdr7IVZN0a1gGFhij7Iv4d8MFY
         9RpIPEjbNfGtctfuaN0LPmM2Anv+4qUzACpAw8RQ2H5w6m5YL8pc/JIf+DWzxIifZvq2
         apdCvceVX4dudDE+vCtMGoke9APzS+4g2EvkqjuvnzV7Gsrqtv0PFhhGB/esG5lvkcP3
         zTYsM13nvZWjnVvCa1/3+tz/GlMYXKMBbNt+4h1ValR5X9eoEsrz1IP0KqViUT3Krq0i
         +v+NV2Mq7dUUbcUFPSPXBa7A6m1/YdOU3+NSF4ANSuEpF5pclvEN8pIIkZomxk0qqTv6
         C+WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725338424; x=1725943224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cdnj9Zz3hw6z4FvXFHwiMTxGt0Sxrpw5JUwKvvnheYQ=;
        b=EN36YtKc59u3FKdIVLIXipcDDXLQTRZFylpUcpJ7+aRy6zIFMUaCGrBPjNlrsmfx7K
         kJsQ/7suCUIZGj9lSFDvfc1F0gLER4qDSmS9MlklFIGMuait1H7+cqDgrHZtTfKsrHvR
         cA4VsSlo0ypxj0/l+ZncVX/h+xsei5bTNjXPJwFvn+Z81/mnAY/15g60RoYgh3D0GodC
         ivRZ7R5xXsJXUktduQK4z+syDe4HG8hnlZCw7Tc8MT/NJLxPVM33y1UkDfW82xxWnxrY
         49kFPOB1KqEneT4OAuAR5lnzpdtXnfxxXJ9ooncBver6LGcGm6M0fNO7T2jXRVonlc2A
         rOyQ==
X-Gm-Message-State: AOJu0Yxpd/e0W17WAu4lCSt4c+RiNVr/eImOHaNwYZM+7cWMhDd+XzT9
	Wh/QMiHeqJlXRKhhk+gzzf+ISAjAsI53FHNkCxgMm31+vMI5uXjbI+UiZWZu
X-Google-Smtp-Source: AGHT+IHgH7AEDA36dZ4SDClpqO4931yxUHGKSUISoEt+GB/dh+cpl1SE4twTN0dKjRZSl524olvIwA==
X-Received: by 2002:a05:6870:e40a:b0:277:d995:423b with SMTP id 586e51a60fabf-27810c11186mr2660331fac.24.1725338423770;
        Mon, 02 Sep 2024 21:40:23 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:9d80:4380::496c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e743245sm6989103a12.10.2024.09.02.21.40.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 21:40:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/2] kea: Replace Name::NameString with vector of uint8_t
Date: Mon,  2 Sep 2024 21:40:17 -0700
Message-ID: <20240903044018.3470887-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 03 Sep 2024 04:40:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204117

This will fix build with libc++ from llvm 19.x

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...me-NameString-with-vector-of-uint8_t.patch | 90 +++++++++++++++++++
 ...po-in-Name-Name-append-to-ndata_-not.patch | 36 ++++++++
 meta/recipes-connectivity/kea/kea_2.6.1.bb    |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
 create mode 100644 meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch

diff --git a/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch b/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
new file mode 100644
index 00000000000..a7deeca2432
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0001-Replace-Name-NameString-with-vector-of-uint8_t.patch
@@ -0,0 +1,90 @@
+From 6b9fb56e3573aa65923df9a08201dd5321a1b1f1 Mon Sep 17 00:00:00 2001
+From: Dimitry Andric <dimitry@andric.com>
+Date: Sat, 3 Aug 2024 14:37:52 +0200
+Subject: [PATCH 1/2] Replace Name::NameString with vector of uint8_t
+
+As noted in the libc++ 19 release notes, it now only provides
+std::char_traits<> for types char, char8_t, char16_t, char32_t and
+wchar_t, and any instantiation for other types will fail.
+
+Name::NameString is defined as a std::basic_string<uint8_t>, so that
+will no longer work. Redefine it as a std::vector<uint8_t> instead.
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/dns/name.cc | 12 ++++++------
+ src/lib/dns/name.h  |  2 +-
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
+index ac48205..085229b 100644
+--- a/src/lib/dns/name.cc
++++ b/src/lib/dns/name.cc
+@@ -303,7 +303,7 @@ Name::Name(const std::string &namestring, bool downcase) {
+     // And get the output
+     labelcount_ = offsets.size();
+     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
+-    ndata_.assign(ndata.data(), ndata.size());
++    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
+     length_ = ndata_.size();
+     offsets_.assign(offsets.begin(), offsets.end());
+ }
+@@ -336,7 +336,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
+     // Get the output
+     labelcount_ = offsets.size();
+     isc_throw_assert(labelcount_ > 0 && labelcount_ <= Name::MAX_LABELS);
+-    ndata_.assign(ndata.data(), ndata.size());
++    ndata_.assign(ndata.data(), ndata.data() + ndata.size());
+     length_ = ndata_.size();
+     offsets_.assign(offsets.begin(), offsets.end());
+ 
+@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
+         // Drop the last character of the data (the \0) and append a copy of
+         // the origin's data
+         ndata_.erase(ndata_.end() - 1);
+-        ndata_.append(origin->ndata_);
++        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
+ 
+         // Do a similar thing with offsets. However, we need to move them
+         // so they point after the prefix we parsed before.
+@@ -582,7 +582,7 @@ Name::concatenate(const Name& suffix) const {
+ 
+     Name retname;
+     retname.ndata_.reserve(length);
+-    retname.ndata_.assign(ndata_, 0, length_ - 1);
++    retname.ndata_.assign(ndata_.data(), ndata_.data() + length_ - 1);
+     retname.ndata_.insert(retname.ndata_.end(),
+                           suffix.ndata_.begin(), suffix.ndata_.end());
+     isc_throw_assert(retname.ndata_.size() == length);
+@@ -622,7 +622,7 @@ Name::reverse() const {
+     NameString::const_iterator n0 = ndata_.begin();
+     retname.offsets_.push_back(0);
+     while (rit1 != offsets_.rend()) {
+-        retname.ndata_.append(n0 + *rit1, n0 + *rit0);
++        retname.ndata_.insert(retname.ndata_.end(), n0 + *rit1, n0 + *rit0);
+         retname.offsets_.push_back(retname.ndata_.size());
+         ++rit0;
+         ++rit1;
+@@ -662,7 +662,7 @@ Name::split(const unsigned int first, const unsigned int n) const {
+     // original name, and append the trailing dot explicitly.
+     //
+     retname.ndata_.reserve(retname.offsets_.back() + 1);
+-    retname.ndata_.assign(ndata_, offsets_[first], retname.offsets_.back());
++    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
+     retname.ndata_.push_back(0);
+ 
+     retname.length_ = retname.ndata_.size();
+diff --git a/src/lib/dns/name.h b/src/lib/dns/name.h
+index 37723e8..fac0036 100644
+--- a/src/lib/dns/name.h
++++ b/src/lib/dns/name.h
+@@ -228,7 +228,7 @@ class Name {
+     //@{
+ private:
+     /// \brief Name data string
+-    typedef std::basic_string<uint8_t> NameString;
++    typedef std::vector<uint8_t> NameString;
+     /// \brief Name offsets type
+     typedef std::vector<uint8_t> NameOffsets;
+ 
diff --git a/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch b/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
new file mode 100644
index 00000000000..a24a25f1c9c
--- /dev/null
+++ b/meta/recipes-connectivity/kea/files/0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch
@@ -0,0 +1,36 @@
+From b5f6cc6b3a2b2c35c9b9bb856861c502771079cc Mon Sep 17 00:00:00 2001
+From: Dimitry Andric <dimitry@unified-streaming.com>
+Date: Wed, 28 Aug 2024 22:32:44 +0200
+Subject: [PATCH 2/2] Fix unittests: * Typo in `Name::Name`: append to
+ `ndata_`, not `ndata` * In `Name::split`, use the correct iterators for
+ assigning
+
+Upstream-Status: Submitted [https://gitlab.isc.org/isc-projects/kea/-/merge_requests/2410]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/lib/dns/name.cc | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/src/lib/dns/name.cc b/src/lib/dns/name.cc
+index 085229b..47d9b8f 100644
+--- a/src/lib/dns/name.cc
++++ b/src/lib/dns/name.cc
+@@ -347,7 +347,7 @@ Name::Name(const char* namedata, size_t data_len, const Name* origin,
+         // Drop the last character of the data (the \0) and append a copy of
+         // the origin's data
+         ndata_.erase(ndata_.end() - 1);
+-        ndata_.insert(ndata.end(), origin->ndata_.begin(), origin->ndata_.end());
++        ndata_.insert(ndata_.end(), origin->ndata_.begin(), origin->ndata_.end());
+ 
+         // Do a similar thing with offsets. However, we need to move them
+         // so they point after the prefix we parsed before.
+@@ -662,7 +662,8 @@ Name::split(const unsigned int first, const unsigned int n) const {
+     // original name, and append the trailing dot explicitly.
+     //
+     retname.ndata_.reserve(retname.offsets_.back() + 1);
+-    retname.ndata_.assign(ndata_.data() + offsets_[first], ndata_.data() + retname.offsets_.back());
++    auto it = ndata_.data() + offsets_[first];
++    retname.ndata_.assign(it, it + retname.offsets_.back());
+     retname.ndata_.push_back(0);
+ 
+     retname.length_ = retname.ndata_.size();
diff --git a/meta/recipes-connectivity/kea/kea_2.6.1.bb b/meta/recipes-connectivity/kea/kea_2.6.1.bb
index bd9e63ceed2..4f8c4124cb4 100644
--- a/meta/recipes-connectivity/kea/kea_2.6.1.bb
+++ b/meta/recipes-connectivity/kea/kea_2.6.1.bb
@@ -17,6 +17,8 @@ SRC_URI = "http://ftp.isc.org/isc/kea/${PV}/${BP}.tar.gz \
            file://fix-multilib-conflict.patch \
            file://fix_pid_keactrl.patch \
            file://0001-src-lib-log-logger_unittest_support.cc-do-not-write-.patch \
+           file://0001-Replace-Name-NameString-with-vector-of-uint8_t.patch \
+           file://0002-Fix-unittests-Typo-in-Name-Name-append-to-ndata_-not.patch \
            "
 SRC_URI[sha256sum] = "d2ce14a91c2e248ad2876e29152d647bcc5e433bc68dafad0ee96ec166fcfad1"
 

