Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5573AC44508
	for <webhook@archiver.kernel.org>; Wed, 21 Jan 2026 21:07:44 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22538.1769029660300162564
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 13:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=R7T9LxT9;
 spf=pass (domain: konsulko.com, ip: 209.85.214.170, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a7786d7895so1871595ad.1
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 13:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1769029659; x=1769634459; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8AAK6eo0CnHi1pL6gpaxAfyaJyRqUoCxUh75qaO8E7s=;
        b=R7T9LxT9MKkhCX4CeFBAzxh4vn0geYcuvCD3vXTxUECMmje6Q/s9Kmj2zmNPdAGWTV
         a2XjMnjhdKzV9I65qZ/WU0wYW2Mc6OH95mLe/m1L3BC0c6Ws06XpcN8GpmQyT2BUIDfs
         iV9HQ0LhqCpDPE5cnzDq7rFRtw5VT52whYqu8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769029659; x=1769634459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8AAK6eo0CnHi1pL6gpaxAfyaJyRqUoCxUh75qaO8E7s=;
        b=EW6WRlVzFtgAu5rEwRPdit7yuWosGkrTLHf65M4dGIAqJeTrItXujXw8fth/fEEHEn
         dJxEcEpvWCfa9oXHxGhfUGKFmjVzRTZdpSkhP5jHeklqyxPT9o79RbkPJA6KvmB6N0qB
         YCV4QFIlKJhpmNEU8zBwVGVBPoz7iVWvt1XoksfwtGXqq5Iw+zdWq2MDLn5AJHZtRh22
         0LHvFwJiJk6OjRSkexQxaRNOn9vTpk54Q9M5jUGe8bbpzhx04rQiI5mAiemJW5c+qGQD
         pl/buzEsxfzmId58bRl/nUx0yRTDiI/sM/5CzpxvriOvtWAFW2LVRiMSnY292qNoWlqc
         WlaA==
X-Gm-Message-State: AOJu0YyCcGXar68HLU/Fmf18sNxEZGgPYDFy4I9/P69Rma2xgy6Ejbg2
	/fENY9S9+OEOIJz4Yh746c5qg0aMnrWvQcBeGA3r7s58Uv5NUXP9o1hYJ3GiPOwD2AezGLcxYXg
	qnoz0
X-Gm-Gg: AZuq6aKaG6TSxaLza5Yu7oYTQgjgV75CDo2EgDGu1pcneYIHyFrDBeRJWHFC9tVURHm
	B6CR++zZ/nbzZ5sWmWTUH7S1plyyUk8sXjsKuBgNnrS2T9Ay7617HvacWHKV/LKfQeBF7YPq2UK
	LIZoJMOEHfN4M75kqU9X4nd8BL+WWUQy4xo0hyXSgLEICpm4GPdPxNNJH7pkp2cUfaHfkXyZRNq
	SX+6tFbJ8vLEscNqvgF8GNZhLzIJRWaQy1ff37nwspaPyvY2hXkJjHdSEhGicK7XWbdyU6ijVUy
	k5sHaJlJi8h/YgsaYwZcghzrgBPCFFHLQRKdph5UpD372fIxu7T2I7SDgFebKg+s4DknIJvergq
	fxAxUdPH9ZEF07FMe5SnOCKrAOmgTl/ms7aCXWCdINMcUf7dT/uFJv6f7KsQNOPcFNFAn5Pm+p+
	HFPjFrpZths0H5LoHzHGAjGxbmSlvb/Cy/jiuVTCFoP72lLwVXs5YcYwiA6pfm
X-Received: by 2002:a17:902:a501:b0:29e:e925:1abf with SMTP id d9443c01a7336-2a71891acffmr114045885ad.43.1769029659284;
        Wed, 21 Jan 2026 13:07:39 -0800 (PST)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7193dae08sm164207595ad.51.2026.01.21.13.07.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 13:07:38 -0800 (PST)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/3] lib/oeqa/files/maturin: update guessing_game
Date: Wed, 21 Jan 2026 13:07:18 -0800
Message-ID: <81cc096296fc24445357b353a4c73435e268001c.1769028980.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1769028980.git.tim.orling@konsulko.com>
References: <cover.1769028980.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Jan 2026 21:07:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229824

From: Tim Orling <tim.orling@konsulko.com>

Update to include changes in upstream Maturin Tutorial [1]
and for newer Rust and Python.

Cargo.toml:
* version: 0.1.0 -> 0.3.0 (to align with [2])
* edition: 2021 -> 2024
* Dependencies:
  - rand: 0.8.5 -> 0.9.0
  - pyo3: 0.21.2 -> 0.27.2
  - abi3-py38 -> abi3-py39 (Python 3.8 reached EOL in October 2024)

pyproject.toml:
* restrict maturin to >=1.7 to ensure PyO3 27.0+ and python 3.13+ support

src/lib.rs:
* rand 0.9 API change: rand::thread_rng() was removed. Use rand::rng() or
  the convenience function rand::random_range().
* PyO3 0.27 has breaking API changes from 0.21. The #[pymodule] function
  signature changed from fn module_name(py: Python, m: &PyModule) to
  fn module_name(m: &Bound<'_, PyModule>).

With help from Claude.ai

[1] https://www.maturin.rs/tutorial.html
[2] https://github.com/moto-timo/guessing-game/releases/tag/v0.3.0

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml | 12 ++++++------
 .../oeqa/files/maturin/guessing-game/pyproject.toml  |  2 +-
 meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs |  4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
index a78ada2593..5c0c06db4b 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
+++ b/meta/lib/oeqa/files/maturin/guessing-game/Cargo.toml
@@ -1,7 +1,7 @@
 [package]
 name = "guessing-game"
-version = "0.1.0"
-edition = "2021"
+version = "0.3.0"
+edition = "2024"
 
 # See more keys and their definitions at https://doc.rust-lang.org/cargo/reference/manifest.html
 
@@ -11,10 +11,10 @@ name = "guessing_game"
 crate-type = ["cdylib"]
 
 [dependencies]
-rand = "0.8.4"
+rand = "0.9.0"
 
 [dependencies.pyo3]
-version = "0.24.1"
-# "abi3-py38" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.8
-features = ["abi3-py38"]
+version = "0.27.2"
+# "abi3-py39" tells pyo3 (and maturin) to build using the stable ABI with minimum Python version 3.9
+features = ["abi3-py39"]
 
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml b/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
index ff35abc472..ecd34372a5 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
+++ b/meta/lib/oeqa/files/maturin/guessing-game/pyproject.toml
@@ -1,5 +1,5 @@
 [build-system]
-requires = ["maturin>=1.0,<2.0"]
+requires = ["maturin>=1.7,<2.0"]
 build-backend = "maturin"
 
 [tool.maturin]
diff --git a/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs b/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
index 6828466ed1..0c757c291f 100644
--- a/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
+++ b/meta/lib/oeqa/files/maturin/guessing-game/src/lib.rs
@@ -7,7 +7,7 @@ use std::io;
 fn guess_the_number() {
     println!("Guess the number!");
 
-    let secret_number = rand::thread_rng().gen_range(1..101);
+    let secret_number = rand::rng().random_range(1..101);
 
     loop {
         println!("Please input your guess.");
@@ -40,7 +40,7 @@ fn guess_the_number() {
 /// the `lib.name` setting in the `Cargo.toml`, else Python will not be able to
 /// import the module.
 #[pymodule]
-fn guessing_game(_py: Python, m: &PyModule) -> PyResult<()> {
+fn guessing_game(m: &Bound<'_, PyModule>) -> PyResult<()> {
     m.add_function(wrap_pyfunction!(guess_the_number, m)?)?;
 
     Ok(())
-- 
2.43.0


