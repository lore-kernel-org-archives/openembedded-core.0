Return-Path: <jason.wessel@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 035107F3AE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 19:38:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x76JbURe021641
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 12:38:16 -0700
Received: from [192.168.10.15] (172.25.59.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 12:37:56 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190806173101.28671-1-jason.wessel@windriver.com>
	<CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
	<32e8e38d-b215-b56e-d523-71811803db99@windriver.com>
	<902909f9-0c57-5e0f-9c68-b73722a32869@windriver.com>
	<CANNYZj_h6f6vR83Zbw=H0NGaVLt3bGpd85Ra3ukYaJvwN0Vy-g@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <f411e447-22eb-e23b-9b1e-f8f1925d3e13@windriver.com>
Date: Tue, 6 Aug 2019 14:37:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj_h6f6vR83Zbw=H0NGaVLt3bGpd85Ra3ukYaJvwN0Vy-g@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sqlite3: Always build sqlite3-native with zlib
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
X-List-Received-Date: Tue, 06 Aug 2019 19:38:42 -0000
Content-Type: multipart/alternative;
	boundary="------------9622D1932AD25C85B5A31D7B"
Content-Language: en-US

--------------9622D1932AD25C85B5A31D7B
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/19 2:17 PM, Alexander Kanavin wrote:
> On Tue, 6 Aug 2019 at 20:52, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>
>     Just to follow up to be very specific about how I deleted files, you can see the identical failure with:
>
>     sudo yum install -y zlib-devel
>
>     rm -rf tmp
>
>     bitbake -c cleansstate sqlite3-native
>
>     bitbake sqlite3-native
>
>     sudo yum remove -y zlib-devel
>
>     bitbake -c cleansstate pseudo-native
>
>     bitbake pseudo-native
>
>
>     I seriously doubt this is exactly what is going on on the host builder which failed.  More analysis would be needed as I explained earlier to draw a final conclusion.  Either way sqlite3-native should be configured to build consistently, which would prevent this kind of contamination.
>
>
> This is not quite what I meant. I meant looking at the source code of sqlite, and finding out how exactly it is looking for zlib, and where things might go wrong (e.g. host contamination, or other possible causes of non-determinism). There might be a configure switch to control that behavior, or something similar that we can use to achieve deterministic builds.
>

Sqlite3 doesn't have a an explicit disable.  It has the typical autoconf check for a header/library.  From configure.ac:


AC_CHECK_HEADERS(zlib.h,[
   AC_SEARCH_LIBS(deflate,z,[BUILD_CFLAGS="$BUILD_CFLAGS -DSQLITE_HAVE_ZLIB"])
])

This means it would need to be patched if you want to make it a pkgconfig option, or play games with the configure cache values...  I chose zlib as a default dependency because it was the easiest to implement.  If we really want to make it not build with zlib or build it conditionally, it is certainly possible.  Is that what is needed to get this patch accepted?

Jason.



--------------9622D1932AD25C85B5A31D7B
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 8/6/19 2:17 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj_h6f6vR83Zbw=H0NGaVLt3bGpd85Ra3ukYaJvwN0Vy-g@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr" class="gmail_attr">On Tue, 6 Aug 2019 at 20:52,
          Jason Wessel &lt;<a href="mailto:jason.wessel@windriver.com"
            moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <div class="gmail_quote">
          <blockquote class="gmail_quote">
            <div><br>
              <p>Just to follow up to be very specific about how I
                deleted files, you can see the identical failure with:</p>
              <p>sudo yum install -y zlib-devel</p>
              rm -rf tmp<br>
              <p>bitbake -c cleansstate sqlite3-native</p>
              <p>bitbake sqlite3-native</p>
              <p>sudo yum remove -y zlib-devel</p>
              <p>bitbake -c cleansstate pseudo-native</p>
              <p>bitbake pseudo-native<br>
              </p>
              <p><br>
              </p>
              <p>I seriously doubt this is exactly what is going on on
                the host builder which failed.  More analysis would be
                needed as I explained earlier to draw a final
                conclusion.  Either way sqlite3-native should be
                configured to build consistently, which would prevent
                this kind of contamination. <br>
              </p>
            </div>
          </blockquote>
          <div><br>
          </div>
          <div>This is not quite what I meant. I meant looking at the
            source code of sqlite, and finding out how exactly it is
            looking for zlib, and where things might go wrong (e.g. host
            contamination, or other possible causes of non-determinism).
            There might be a configure switch to control that behavior,
            or something similar that we can use to achieve
            deterministic builds.<br>
          </div>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Sqlite3 doesn't have a an explicit disable.  It has the typical
      autoconf check for a header/library.  From configure.ac:</p>
    <p><br>
    </p>
    <p>AC_CHECK_HEADERS(zlib.h,[<br>
        AC_SEARCH_LIBS(deflate,z,[BUILD_CFLAGS="$BUILD_CFLAGS
      -DSQLITE_HAVE_ZLIB"])<br>
      ])<br>
      <br>
    </p>
    <p>This means it would need to be patched if you want to make it a
      pkgconfig option, or play games with the configure cache
      values...  I chose zlib as a default dependency because it was the
      easiest to implement.  If we really want to make it not build with
      zlib or build it conditionally, it is certainly possible.  Is that
      what is needed to get this patch accepted? <br>
    </p>
    <p>Jason.<br>
    </p>
    <br>
  </body>
</html>

--------------9622D1932AD25C85B5A31D7B--
