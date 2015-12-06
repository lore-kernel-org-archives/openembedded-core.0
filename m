Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 00165601A5
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Dec 2015 08:19:59 +0000 (UTC)
Received: by igcph11 with SMTP id ph11so57272425igc.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 06 Dec 2015 00:20:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=AQEQ6vdayHTUfXF62xjmHc3npFmqcf/6JeUrXECfc+Y=;
	b=vQz8gEjugXcXHhOxrRscbT9MbXWRNtymRfq0f3WGnMoccVYVrgGw9EcohwtTvpT+WL
	6PK5WBP9G7YeSnLR1tJQfhHeQdg/lpdEjcx+kFiA0GES64AzIJgLjyJgvLb0KL6iLiCi
	o8HaKcNO1/Hv6jH9sD5X7Nf8+GWRaL4wXo7/3F7mTNlhkxZPVR9QkA4eM7pnJvfID+kO
	W0fkeuR2R1AfAUjy09iwLwig38hP5Oslux/0hCfPrsFrrf0kutkY+gAiyHLJPdsqQ+rU
	2K9WV0EANAx/umsbTavRJJOus2NVhENvwbiaLk4F4Drorqd1IHmnAlLDCKYExd3K0kSV
	p2nA==
X-Received: by 10.50.79.196 with SMTP id l4mr1686644igx.77.1449390000142; Sun,
	06 Dec 2015 00:20:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.12.205 with HTTP; Sun, 6 Dec 2015 00:19:30 -0800 (PST)
In-Reply-To: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
References: <1449194500-9664-1-git-send-email-Yuanjie.Huang@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 6 Dec 2015 00:19:30 -0800
Message-ID: <CAMKF1sqm0g5=+wDwaR_CC3MGHG4vdBCU_EMVJr1=8kCUQjX+cQ@mail.gmail.com>
To: Yuanjie Huang <Yuanjie.Huang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc: Security Advisory - gcc - CVE-2015-5276
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Dec 2015 08:20:00 -0000
Content-Type: text/plain; charset=UTF-8

you also need to backport

https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=fd16f36d1986fbbb9f802b3649e543f3f41227ea

along with the others

On Thu, Dec 3, 2015 at 6:01 PM, Yuanjie Huang
<Yuanjie.Huang@windriver.com> wrote:
> From: Yuanjie Huang <yuanjie.huang@windriver.com>
>
> The std::random_device class in libstdc++ in the GNU Compiler Collection
> (aka GCC) before 4.9.4 does not properly handle short reads from
> blocking sources, which makes it easier for context-dependent attackers
> to predict the random values via unspecified vectors.
>
> https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-5276
>
> Patches backported from upstream as:
> git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227687
> 138bc75d-0d04-0410-961f-82ee72b054a4
> git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227872
> 138bc75d-0d04-0410-961f-82ee72b054a4
>
> Upstream-status: backport[4.9.4]
>
> Signed-off-by: Yuanjie Huang <yuanjie.huang@windriver.com>
> ---
>  meta/recipes-devtools/gcc/gcc-4.9.inc              |  2 +
>  ...67-Check-read-result-in-std-random_device.patch | 57 +++++++++++++++++
>  ...std-random_device-retry-after-short-reads.patch | 71 ++++++++++++++++++++++
>  3 files changed, 130 insertions(+)
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
>  create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch
>
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
> index 6ac3685..f3af41f 100644
> --- a/meta/recipes-devtools/gcc/gcc-4.9.inc
> +++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
> @@ -82,6 +82,8 @@ SRC_URI = "\
>      file://0064-handle-target-sysroot-multilib.patch \
>      file://0065-gcc-483-universal-initializer-no-warning.patch \
>      file://0066-cxxflags-for-build.patch \
> +    file://0067-Check-read-result-in-std-random_device.patch \
> +    file://0068-Make-std-random_device-retry-after-short-reads.patch \
>  "
>  SRC_URI[md5sum] = "6f831b4d251872736e8e9cc09746f327"
>  SRC_URI[sha256sum] = "2332b2a5a321b57508b9031354a8503af6fdfb868b8c1748d33028d100a8b67e"
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch b/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
> new file mode 100644
> index 0000000..352567f
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0067-Check-read-result-in-std-random_device.patch
> @@ -0,0 +1,57 @@
> +From 2ef472318fe63bc092d3f1cc455116c50f853adf Mon Sep 17 00:00:00 2001
> +From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Fri, 11 Sep 2015 13:44:26 +0000
> +Subject: [PATCH 1/2] Check read() result in std::random_device.
> +
> +       PR libstdc++/65142
> +       * src/c++11/random.cc (random_device::_M_getval()): Check read result.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227687 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> +---
> + libstdc++-v3/ChangeLog           |  5 +++++
> + libstdc++-v3/src/c++11/random.cc | 12 ++++++++----
> + 2 files changed, 13 insertions(+), 4 deletions(-)
> +
> +diff --git a/libstdc++-v3/ChangeLog b/libstdc++-v3/ChangeLog
> +index a742a72..51a5a9f 100644
> +--- a/libstdc++-v3/ChangeLog
> ++++ b/libstdc++-v3/ChangeLog
> +@@ -1,3 +1,8 @@
> ++2015-09-11  Jonathan Wakely  <jwakely@redhat.com>
> ++
> ++      PR libstdc++/65142
> ++      * src/c++11/random.cc (random_device::_M_getval()): Check read result.
> ++
> + 2015-06-26  Release Manager
> +
> +       * GCC 4.9.3 released.
> +diff --git a/libstdc++-v3/src/c++11/random.cc b/libstdc++-v3/src/c++11/random.cc
> +index f61daea..ab3e55d 100644
> +--- a/libstdc++-v3/src/c++11/random.cc
> ++++ b/libstdc++-v3/src/c++11/random.cc
> +@@ -129,13 +129,17 @@ namespace std _GLIBCXX_VISIBILITY(default)
> + #endif
> +
> +     result_type __ret;
> ++
> + #ifdef _GLIBCXX_HAVE_UNISTD_H
> +-    read(fileno(static_cast<FILE*>(_M_file)),
> +-       static_cast<void*>(&__ret), sizeof(result_type));
> ++    auto e = read(fileno(static_cast<FILE*>(_M_file)),
> ++                static_cast<void*>(&__ret), sizeof(result_type));
> + #else
> +-    std::fread(static_cast<void*>(&__ret), sizeof(result_type),
> +-             1, static_cast<FILE*>(_M_file));
> ++    auto e = std::fread(static_cast<void*>(&__ret), sizeof(result_type),
> ++                      1, static_cast<FILE*>(_M_file));
> + #endif
> ++    if (e != sizeof(result_type))
> ++      __throw_runtime_error(__N("random_device could not read enough bytes"));
> ++
> +     return __ret;
> +   }
> +
> +--
> +2.0.1
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch b/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch
> new file mode 100644
> index 0000000..e0c475e
> --- /dev/null
> +++ b/meta/recipes-devtools/gcc/gcc-4.9/0068-Make-std-random_device-retry-after-short-reads.patch
> @@ -0,0 +1,71 @@
> +From a1f5c28240646583a99c6cc2986d490f71f2157d Mon Sep 17 00:00:00 2001
> +From: redi <redi@138bc75d-0d04-0410-961f-82ee72b054a4>
> +Date: Thu, 17 Sep 2015 15:06:42 +0000
> +Subject: [PATCH 2/2] Make std::random_device retry after short reads
> +
> +       PR libstdc++/65142
> +       * src/c++11/random.cc (random_device::_M_getval()): Retry after short
> +       reads.
> +
> +git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@227872 138bc75d-0d04-0410-961f-82ee72b054a4
> +Signed-off-by: Yuanjie Huang <Yuanjie.Huang@windriver.com>
> +---
> + libstdc++-v3/ChangeLog           |  6 ++++++
> + libstdc++-v3/src/c++11/random.cc | 24 +++++++++++++++++-------
> + 2 files changed, 23 insertions(+), 7 deletions(-)
> +
> +diff --git a/libstdc++-v3/ChangeLog b/libstdc++-v3/ChangeLog
> +index 51a5a9f..5df4d8c 100644
> +--- a/libstdc++-v3/ChangeLog
> ++++ b/libstdc++-v3/ChangeLog
> +@@ -1,3 +1,9 @@
> ++2015-09-17  Jonathan Wakely  <jwakely@redhat.com>
> ++
> ++      PR libstdc++/65142
> ++      * src/c++11/random.cc (random_device::_M_getval()): Retry after short
> ++      reads.
> ++
> + 2015-09-11  Jonathan Wakely  <jwakely@redhat.com>
> +
> +       PR libstdc++/65142
> +diff --git a/libstdc++-v3/src/c++11/random.cc b/libstdc++-v3/src/c++11/random.cc
> +index ab3e55d..db2f841 100644
> +--- a/libstdc++-v3/src/c++11/random.cc
> ++++ b/libstdc++-v3/src/c++11/random.cc
> +@@ -129,16 +129,26 @@ namespace std _GLIBCXX_VISIBILITY(default)
> + #endif
> +
> +     result_type __ret;
> +-
> ++    void* p = &__ret;
> ++    size_t n = sizeof(result_type);
> + #ifdef _GLIBCXX_HAVE_UNISTD_H
> +-    auto e = read(fileno(static_cast<FILE*>(_M_file)),
> +-                static_cast<void*>(&__ret), sizeof(result_type));
> ++    do
> ++      {
> ++      const int e = read(fileno(static_cast<FILE*>(_M_file)), p, n);
> ++      if (e > 0)
> ++        {
> ++          n -= e;
> ++          p = static_cast<char*>(p) + e;
> ++        }
> ++      else if (e != -1 || errno != EINTR)
> ++        __throw_runtime_error(__N("random_device could not be read"));
> ++      }
> ++    while (n > 0);
> + #else
> +-    auto e = std::fread(static_cast<void*>(&__ret), sizeof(result_type),
> +-                      1, static_cast<FILE*>(_M_file));
> ++    const size_t e = std::fread(p, n, 1, static_cast<FILE*>(_M_file));
> ++    if (e != 1)
> ++      __throw_runtime_error(__N("random_device could not be read"));
> + #endif
> +-    if (e != sizeof(result_type))
> +-      __throw_runtime_error(__N("random_device could not read enough bytes"));
> +
> +     return __ret;
> +   }
> +--
> +2.0.1
> +
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

