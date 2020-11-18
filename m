Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.25271.1605710668297669380
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2020 06:44:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=XM+gv3Bn;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.42, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f42.google.com with SMTP id 7so3141318ejm.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2020 06:44:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JmSw1cQxG30od5/RKGArgQl11cKS9DgPZ5JyuZ8TUEM=;
        b=XM+gv3Bn07RrattKvqMMnXS4vguPZLeSWNl8RHe2Jbp1WXKC0XlrmpVRCz8bQat6Q8
         eICKhZP52BdpFYEh+rULPwoQNF58TOhx/DjVKexY8ITyuw3QLXsMaNYX/OxGtRYC0bih
         t+Xcq61SEuO4dYr9Y0FbxVCJ607T23nWMkObufcDvbQVqNZScLECPt4hrhZgTl3/kSG7
         36iOpjyG/ByTfuYSI5lA0imJHKGB8DlPPT6X0YdVDc3KPeyZcgcY3+CiRP4Sszokyq+w
         gc4Dx+WHcCYwooGnX6BVos7Ba4HcO6bmBrTQKwDMp8sVNzZ4pRQOVF6/kt7jBhUsrL5x
         QAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JmSw1cQxG30od5/RKGArgQl11cKS9DgPZ5JyuZ8TUEM=;
        b=iZyZ/xR3dq4Txxs9ukF7KjJtPxPs3TxAfkaYm+TXySMVcmNzeWSicHUr5gtzHY39jk
         pA/+0vmA3eooP6x5dBsAZaR/0dM/4xz7iqsi8WS2BWf0PAf6oQycsNRQ9CBr4C1kOjCe
         IU51AXYz7EEDXJKGZVp2288kbakUF3eqfMWlPfC8yflQbIjEcWJKcgjNUkd+f5m4SWfL
         Wjf2u4vI/+qgcM52a5cxkdzTG4rB+5HiCpNv0UYZEE0Lgawz07oWWypzGfmbvzGKbsRZ
         vsXnbnPrJdbtz2DZp8Mn8tFloMSTW7dJtEGH9n6vrsnXLSnOZqSPv37wuR9Z1fYku2jJ
         ptUA==
X-Gm-Message-State: AOAM531Rkvr8HMcX0tiRibyxz4CUryMA3FuLkTGYvNgOx5O4L1u0hD7x
	1Jhcstq9Il/zjDd+WqVEeDH6rzwFziTZP2yPKdPoIA==
X-Google-Smtp-Source: ABdhPJxhPfn6VfJsChBMCCOaWQseA5PGrn7LBf34g0vSWOL827zDAkScgjuWULpgeCQ6JLrdoMy8DxkoABCpkCDsCoA=
X-Received: by 2002:a17:906:1e84:: with SMTP id e4mr6810206ejj.57.1605710666660;
 Wed, 18 Nov 2020 06:44:26 -0800 (PST)
MIME-Version: 1.0
References: <20201118132227.48678-1-chee.yang.lee@intel.com>
In-Reply-To: <20201118132227.48678-1-chee.yang.lee@intel.com>
From: "Steve Sakoman" <steve@sakoman.com>
Date: Wed, 18 Nov 2020 04:44:14 -1000
Message-ID: <CAOSpxdYf+5fTzRjrpjteD1t2ntuFLSgw-4X_zcsQ37aGkZLGkQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/4] libproxy: fix CVE-2020-26154
To: Lee Chee Yang <chee.yang.lee@intel.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Thanks for helping with CVE fixes!

This first patch is also appropriate for dunfell, so I will
cherry-pick it when it hits master.

Do you plan to do dunfell versions of the other 3 patches?

Steve

On Wed, Nov 18, 2020 at 3:22 AM Lee Chee Yang <chee.yang.lee@intel.com> wrote:
>
> From: Lee Chee Yang <chee.yang.lee@intel.com>
>
> Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
> ---
>  .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
>  .../libproxy/libproxy_0.4.15.bb               |  1 +
>  2 files changed, 99 insertions(+)
>  create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
>
> diff --git a/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
> new file mode 100644
> index 0000000000..0ccb99da81
> --- /dev/null
> +++ b/meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch
> @@ -0,0 +1,98 @@
> +From 4411b523545b22022b4be7d0cac25aa170ae1d3e Mon Sep 17 00:00:00 2001
> +From: Fei Li <lifeibiren@gmail.com>
> +Date: Fri, 17 Jul 2020 02:18:37 +0800
> +Subject: [PATCH] Fix buffer overflow when PAC is enabled
> +
> +The bug was found on Windows 10 (MINGW64) when PAC is enabled. It turned
> +out to be the large PAC file (more than 102400 bytes) returned by a
> +local proxy program with no content-length present.
> +
> +Upstream-Status: Backport [https://github.com/libproxy/libproxy/commit/6d342b50366a048d3d543952e2be271b5742c5f8]
> +CVE: CVE-2020-26154
> +Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
> +
> +---
> + libproxy/url.cpp | 44 +++++++++++++++++++++++++++++++-------------
> + 1 file changed, 31 insertions(+), 13 deletions(-)
> +
> +diff --git a/libproxy/url.cpp b/libproxy/url.cpp
> +index ee776b2..8684086 100644
> +--- a/libproxy/url.cpp
> ++++ b/libproxy/url.cpp
> +@@ -54,7 +54,7 @@ using namespace std;
> + #define PAC_MIME_TYPE_FB "text/plain"
> +
> + // This is the maximum pac size (to avoid memory attacks)
> +-#define PAC_MAX_SIZE 102400
> ++#define PAC_MAX_SIZE 0x800000
> + // This is the default block size to use when receiving via HTTP
> + #define PAC_HTTP_BLOCK_SIZE 512
> +
> +@@ -478,15 +478,13 @@ char* url::get_pac() {
> +               }
> +
> +               // Get content
> +-              unsigned int recvd = 0;
> +-              buffer = new char[PAC_MAX_SIZE];
> +-              memset(buffer, 0, PAC_MAX_SIZE);
> ++              std::vector<char> dynamic_buffer;
> +               do {
> +                       unsigned int chunk_length;
> +
> +                       if (chunked) {
> +                               // Discard the empty line if we received a previous chunk
> +-                              if (recvd > 0) recvline(sock);
> ++                              if (!dynamic_buffer.empty()) recvline(sock);
> +
> +                               // Get the chunk-length line as an integer
> +                               if (sscanf(recvline(sock).c_str(), "%x", &chunk_length) != 1 || chunk_length == 0) break;
> +@@ -498,21 +496,41 @@ char* url::get_pac() {
> +
> +                       if (content_length >= PAC_MAX_SIZE) break;
> +
> +-                      while (content_length == 0 || recvd != content_length) {
> +-                              int r = recv(sock, buffer + recvd,
> +-                                           content_length == 0 ? PAC_HTTP_BLOCK_SIZE
> +-                                                               : content_length - recvd, 0);
> ++                      while (content_length == 0 || dynamic_buffer.size() != content_length) {
> ++                              // Calculate length to recv
> ++                              unsigned int length_to_read = PAC_HTTP_BLOCK_SIZE;
> ++                              if (content_length > 0)
> ++                                      length_to_read = content_length - dynamic_buffer.size();
> ++
> ++                              // Prepare buffer
> ++                              dynamic_buffer.resize(dynamic_buffer.size() + length_to_read);
> ++
> ++                              int r = recv(sock, dynamic_buffer.data() + dynamic_buffer.size() - length_to_read, length_to_read, 0);
> ++
> ++                              // Shrink buffer to fit
> ++                              if (r >= 0)
> ++                                      dynamic_buffer.resize(dynamic_buffer.size() - length_to_read + r);
> ++
> ++                              // PAC size too large, discard
> ++                              if (dynamic_buffer.size() >= PAC_MAX_SIZE) {
> ++                                      chunked = false;
> ++                                      dynamic_buffer.clear();
> ++                                      break;
> ++                              }
> ++
> +                               if (r <= 0) {
> +                                       chunked = false;
> +                                       break;
> +                               }
> +-                              recvd += r;
> +                       }
> +               } while (chunked);
> +
> +-              if (content_length != 0 && string(buffer).size() != content_length) {
> +-                      delete[] buffer;
> +-                      buffer = NULL;
> ++              if (content_length == 0 || content_length == dynamic_buffer.size()) {
> ++                      buffer = new char[dynamic_buffer.size() + 1];
> ++                      if (!dynamic_buffer.empty()) {
> ++                              memcpy(buffer, dynamic_buffer.data(), dynamic_buffer.size());
> ++                      }
> ++                      buffer[dynamic_buffer.size()] = '\0';
> +               }
> +       }
> +
> diff --git a/meta/recipes-support/libproxy/libproxy_0.4.15.bb b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
> index a14c358cc2..6f704d7a91 100644
> --- a/meta/recipes-support/libproxy/libproxy_0.4.15.bb
> +++ b/meta/recipes-support/libproxy/libproxy_0.4.15.bb
> @@ -11,6 +11,7 @@ DEPENDS = "glib-2.0"
>  SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BP}.tar.xz \
>             file://0001-get-pac-test-Fix-build-with-clang-libc.patch \
>             file://CVE-2020-25219.patch \
> +           file://CVE-2020-26154.patch \
>            "
>  SRC_URI[md5sum] = "f6b1d2a1e17a99cd3debaae6d04ab152"
>  SRC_URI[sha256sum] = "654db464120c9534654590b6683c7fa3887b3dad0ca1c4cd412af24fbfca6d4f"
> --
> 2.17.1
>
>
> 
>
