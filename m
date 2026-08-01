Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42CFDC55174
	for <webhook@archiver.kernel.org>; Sat,  1 Aug 2026 06:22:50 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1045.1785565366361185515
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jul 2026 23:22:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QxV0fgMu;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49550ec592cso9001455e9.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jul 2026 23:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785565365; x=1786170165; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DUdLvehmCij9W4zXbKvmDg18s1fN3D/2MXVgjXXVRkQ=;
        b=QxV0fgMu3JDy9WYZh1YG1OpW5TUXq3/oY3FQFUxGiYzu970IFRB0vDEwzNFWsXgVqn
         IL+jbdiPjWoI5AxYB2Xkv+RHRQolHcDivGkBpxSjDn3VmkkuKJm1j35ovmVZu4wwCq0r
         QQs2V+h+HSn8Tp/Uer8cvH0ESqflnQRleeshA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785565365; x=1786170165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DUdLvehmCij9W4zXbKvmDg18s1fN3D/2MXVgjXXVRkQ=;
        b=be9opbb83eDBEoPyU4D2qDmqWsq1H0seikE74H1hsvejNlEqFBOCmIIbkzKXoRTDtc
         5Erf4QhvoCw/caqCJbSYC+idQ64S5OgbgfN3FPxNfhev/RwwfylzuMbHYL6l+HbYlJZq
         lddDFJI5uyk7z5ON5fYY9NxttNlTdpTAz+J/FDBreBCv/7OcHH+Yc+LM2OYCOVL1WrB+
         MsOEIwKt4QGrbzZqmUqua4Fc0Pvk5N+Sh7HdFXCmqDWpJ2TAC98Ajg8nSLsIM6FFwdpe
         EcUIekgIoZwk3fXc0FE5Egzltjgx0d6sK9fCm2N/25qdwQCZ9+9y+xv7A/fwnOidx2gd
         Bjdg==
X-Gm-Message-State: AOJu0YwHZw7Ql+xQ+xLgFtzG2wxG0KKT+yxz6wBQ+uBIUX3DuQr0+k+W
	5/sZHQExu9o1fwE1wvEh4oJ3yYNx5Ybtf7bnLXxU68zRl5ENV5vNNgvZ0bRc09qR+hkLGgGjgRe
	co13+QT4=
X-Gm-Gg: AR+sD10yZYUj3P4abyw9LuVf9+oaSQC+RKUVb8+2+Bi+yZpU3aVPszCUaDKA9QIeiL7
	ryLyFnkS9rDntEJgxMMyAuSJ/nqfXb5hBzchq5asLUevl9a4qIUMWoOXYbpDbSPG8K86Ocu0tk5
	LbLDAidmMOMMrQSh62SGHjvGxqnOztukb+XGHOfJG7w5KxpV+D8H6TbTxSiED+shKvTy4T1nxJM
	A27kFxkc+vBNSCHSNekATbrnAbvvwaB4IQIWIvItDQWOXEQJw7ryPJ7kkg+0U3c0oq8qKTYfPzp
	uPmxhu8YORg2R2iLjSeiti/e7sFzCYgoLU9/ROtj+H3ZQt7UloCEqF+iLHbbDrpxHzc8mNkZzpy
	4OjzAMJUOnuRbSzYLHja+3mrE9fCmycjkvhsSm2Ab2+JKmZ94YYzh3Sqj5vT3pKRsbpa14lA4v7
	k7lHyeGaqsrepE2w7TOxF8ydlkUuYhdg/h5oZ1F6sgDzfycJAoPVSO66t/xbgJsCYYhFagZD3Df
	GcQNpA8sPSsGA/ZJQ==
X-Received: by 2002:a05:6000:60a:b0:474:bbbb:bf17 with SMTP id ffacd0b85a97d-47fd6f3032emr4338329f8f.0.1785565364568;
        Fri, 31 Jul 2026 23:22:44 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:43cd:3a42:fe4b:e585])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd4068fb7sm13921262f8f.0.2026.07.31.23.22.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 23:22:43 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] nghttp2: upgrade 1.69.0 -> 1.70.0
Date: Sat,  1 Aug 2026 07:22:35 +0100
Message-ID: <20260801062235.2497102-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
References: <20260801062235.2497102-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Aug 2026 06:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242474

Pulls in:

Require C++23 in #2688
Adopt Designated initializers part1 in #2689
Adopt Designated initializers part2 in #2690
Adopt Designated initializers part3 in #2691
tests: Make const values static const in #2692
src: Rewrite util::split_str and its variants in #2693
src: Adopt std::string::resize_and_overwrite in #2694
src: Pass std::chrono::{time_point,duration} by value in #2695
Bump mruby to 4.0.0 in #2696
src: Fix warning "space between quotes and suffix is deprecated in C++23" in #2697
lib, tests: Use C-style comment in #2698
src: Avoid std::chrono::high_resolution_clock in #2699
src: Add noexcept to user-defined literals in #2700
src: Replace std::optional with std::expected in #2701
src/util: Adopt std::expected for error handling in #2702
get_socket_error: Return errno of getsockopt if it fails in #2703
src: Use util::stream_error in #2704
src: Get rid of std::stringstream in #2705
src: Modernize Header and HeaderRef in #2707
src/http2: Adopt std::expected in #2708
src/tls: Adopt std::expected in #2709
nghttpx: Adopt std::expected for Connection read/write in #2710
Nghttpx dconn expected in #2711
Nghttpx downstream expected in #2712
Nghttpx http2session expected in #2713
Nghttpx upstream expected in #2714
Nghttpx clienthandler expected in #2715
Nghttpx httpdownstreamconnection expected in #2716
Nghttpx expected in #2717
Nghttpx http2upstream expected in #2718
Nghttpx http3upstream expected in #2719
Nghttpx mruby expected in #2720
Nghttpx quic expected in #2721
nghttpx: Adopt std::expected for QUICConnectionHandler in #2722
Nghttpx tls expected in #2723
nghttpx: Rewrite time_t_from_asn1_time with ASN1_TIME_diff for boringssl in #2724
Nghttpx livecheck expected in #2725
Nghttpx dns expected in #2726
Nghttpx memcached expected in #2727
Nghttpx misc expected in #2728
Nghttpx worker expected in #2729
Nghttpx connhandler expected in #2730
nghttpx: Pass WorkerEvent without explicit std::move in #2731
nghttpx: Adopt std::expected for worker_process_event_loop in #2732
nghttpx: Adopt std::expected for parse_config in #2733
Nghttpx config expected in #2734
Src fixup in #2735
nghttpx: Adopt std::expected for main routines in #2736
H2load expected in #2737
nghttp: Adopt std::expected in #2738
nghttpd: Adopt std::expected in #2739
HtmlParser: Adopt std::expected in #2740
src: Adopt size_t literal suffix in #2742
nghttp: put pseudo headers before normal headers in #2741
h2load: Replace std::cerr with std::print in #2744
h2load: Replace std::cout with std::print in #2745
nghttpx: Migrate to std::print in #2746
Nghttp print in #2747
Nghttpd print in #2748
src: Migrate std::cout to std::print in #2749
src: Simplify as_string_view usage in #2750
src: Migrate fprintf to C++ counterparts in #2751
src: Use std::println without argument to print just line separator in #2752
nghttpx: Create CID encryption ctx per worker in #2753
nghttpx: Use std::unique_ptr for quic_keying_materials_ in #2754
Src optimize in #2755
src: Provide faster hash functions for OpenSSL forks in #2756
src: Adopt std::expected for http2::make_websocket_accept_token in #2757
src: NSDMI part1 in #2758
src: Add noexcept to move ctor and assignment operator in #2759
build(deps): bump github.com/quic-go/quic-go from 0.59.0 to 0.59.1 in #2760
build(deps): bump golang.org/x/net from 0.53.0 to 0.54.0 in #2761
src: MSDMI part2 in #2762
Avoid azure ubuntu mirror in #2763
src: MSDMI part3 in #2764
src/allocator: Rewrite concat_string_ref with fold expression in #2765
src: Fix build failure on macos26 in #2766
cmake: Remove CMAKE_CXX_STANDARD 23 that is not needed there in #2767
Fix base64 oob in #2768
Nghttpx upgrade in #2769
Make NGHTTP2_HTTP_FLAG_* macros and make them unsigned in #2770
Define flags as macros in #2771
Make NGHTTP2_EXTPRI_INC_MASK unsigned in #2772
src: Avoid zero-argument std::println in #2773
build(deps): bump golang.org/x/net from 0.54.0 to 0.55.0 in #2774
GHA: Add Cygwin build in #2775
Fix docker build in #2776
lib: Rewrite integer decoder in http in #2777
Bump ngtcp2 and its dependencies in #2778
Avoid deprecated ngtcp2 and nghttp3 apis in #2779
net: Use macros for win32 hton*/ntoh* fallbacks in #2780
lib: Add nghttp2_downcase_byte in #2781
Rework HTTP header validation in #2782
Bump sfparse in #2783
helper: Initialize array with designated initializers in #2784
Reformat downcase table in #2785
http: Initialize array with designated initializers in #2786
Upper case hex integer literals in huffman data table in #2787
Upcase hex in #2788
Nghttpx h2 stream write timeout in #2789
bpf, examples, tests: Upper case hex integer literals in #2790
Reformat huffman data table in #2791
nghttpx: Provide frontend and backend stream timeouts in #2794
build(deps): bump github.com/quic-go/quic-go from 0.59.1 to 0.60.0 in #2792
nghttpx: Reformat help message to make it editor friendly in #2796
nghttpx: Drop connection when frontend write rate is too low in #2797
build(deps): bump golang.org/x/net from 0.55.0 to 0.56.0 in #2799
build(deps): bump actions/checkout from 6 to 7 in #2800
Bump ngtcp2 and its dependencies in #2802
nghttpx: Drop h3 connection when frontend write rate is too low in #2803
build(deps): bump actions/cache from 5 to 6 in #2804
Gcc 16 in #2805
nghttpx: NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE is not allowed in on_frame_recv_callback in #2806
nghttpx: Rename completeCb_ to complete_cb_ in #2807
nghttpx: Remove unused unordered_set include in #2808
Require nghttp3 >= 1.17.0 in #2810
Add the missing header value check for priority header field in #2813
build(deps): bump golang.org/x/net from 0.56.0 to 0.57.0 in #2814
build(deps): bump actions/setup-go from 6 to 7 in #2815
Count CONTINUATIONS per its frame header in #2818
build(deps): bump github.com/quic-go/quic-go from 0.60.0 to 0.61.0 in #2819
Bump ngtcp2 and its dependencies in #2820
Bump neverbleed in #2821
Bump llhttp to v9.4.2 in #2822
nghttpx: Reset quic upstream addr fd to the current path in #2823

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../nghttp2/{nghttp2_1.69.0.bb => nghttp2_1.70.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/nghttp2/{nghttp2_1.69.0.bb => nghttp2_1.70.0.bb} (84%)

diff --git a/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
similarity index 84%
rename from meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
rename to meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
index 8f3e1e4a97b..1b09f91ce61 100644
--- a/meta/recipes-support/nghttp2/nghttp2_1.69.0.bb
+++ b/meta/recipes-support/nghttp2/nghttp2_1.70.0.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=764abdf30b2eadd37ce47dcbce0ea1ec"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/nghttp2-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "1fb324b6ec2c56f6bde0658f4139ffd8209fa9e77ce98fd7a5f63af8d0e508ad"
+SRC_URI[sha256sum] = "e05cb1388eaca3830aded4ccf20044b6e1ac1a61411dcca11b0437c4285c8bc2"
 
 inherit cmake manpages python3native github-releases
 

