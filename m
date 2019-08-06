Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 671057ED57
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Aug 2019 18:36:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x76IaWdQ000421
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Aug 2019 11:36:32 -0700 (PDT)
Received: from [192.168.10.15] (172.25.59.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.468.0;
	Tue, 6 Aug 2019 11:36:32 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <20190806173101.28671-1-jason.wessel@windriver.com>
	<CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
From: Jason Wessel <jason.wessel@windriver.com>
Message-ID: <32e8e38d-b215-b56e-d523-71811803db99@windriver.com>
Date: Tue, 6 Aug 2019 13:36:31 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com>
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
X-List-Received-Date: Tue, 06 Aug 2019 18:36:32 -0000
Content-Type: multipart/alternative;
	boundary="------------7583488E304B0A0F5A6A0AF9"
Content-Language: en-US

--------------7583488E304B0A0F5A6A0AF9
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/19 12:55 PM, Alexander Kanavin wrote:
>
>
> On Tue, 6 Aug 2019 at 19:31, Jason Wessel <jason.wessel@windriver.com <mailto:jason.wessel@windriver.com>> wrote:
>
>     The build of sqlite3-native is not fully deterministic.  There is some
>     corner case as shown with the recent pseudo commit where the sqlite3
>     will sometimes link against zlib.  It is possible that in a build with
>     sstate that since the zlib is not listed, that pseudo-native will fail
>     to build because it calls the pkg-config to get the link arguments for
>     sqlite3 and will ultimately try to link against zlib.
>
>
> It would be good to dig a little deeper and get to the root cause of why sqlite *sometimes* does it. The fix provided below seems like fixing the symptom, not the problem.
>
> Alex


Without getting access to the build machine where it failed to perform more in depth forensics it is a bit hard to determine the exact cause.  I performed some local testing using the Fedora 28 and could not replicate the exact circumstance unless I deleted a file in the sysroot.  From what I can tell there are two ways of seeing the problem.

1) Host contamination

% pkg-config sqlite3 --libs --static
-lsqlite3 -lm -ldl -lz -lpthread

This was not the way the sqlite3 was built.  However there is no way to know if this was the circumstance without poking around in the log files and re-running the context of the run.do_compile script in the packages temp directory.

2) Dependency race

This is the one where I deleted a file to simulate the problem, but I couldn't reproduce it.  For this, we'd really need to look at the failed machine's log of the build of sqlite3, which may be long gone from the sstate.  But it should have the pkg-config files laying around.  If it shows that it did build against the zlib, but zlib was not listed dependency it was never going to build because the recipe-sysroot-native is not going to have the required library.

There of course might be other ways to end up with the same result but these are the most likely candidates, each of which is fixed by listing the dependency.   I too would like to know the actual root cause, but without access to the build it is hard to track it down.

Cheers,

Jason


--------------7583488E304B0A0F5A6A0AF9
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <div class="moz-cite-prefix">On 8/6/19 12:55 PM, Alexander Kanavin
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CANNYZj96=yCYWO_UG9MkUx2HvwG00v0n3dTK5aMdhqb3BHhFjw@mail.gmail.com">
      <div dir="ltr">
        <div dir="ltr"><br>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Tue, 6 Aug 2019 at 19:31,
            Jason Wessel &lt;<a href="mailto:jason.wessel@windriver.com"
              moz-do-not-send="true">jason.wessel@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote">The build of sqlite3-native is
            not fully deterministic.  There is some<br>
            corner case as shown with the recent pseudo commit where the
            sqlite3<br>
            will sometimes link against zlib.  It is possible that in a
            build with<br>
            sstate that since the zlib is not listed, that pseudo-native
            will fail<br>
            to build because it calls the pkg-config to get the link
            arguments for<br>
            sqlite3 and will ultimately try to link against zlib.<br>
          </blockquote>
          <div><br>
          </div>
          <div>It would be good to dig a little deeper and get to the
            root cause of why sqlite *sometimes* does it. The fix
            provided below seems like fixing the symptom, not the
            problem.</div>
        </div>
        <div class="gmail_quote"><br>
        </div>
        <div class="gmail_quote">Alex<br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
    <p>Without getting access to the build machine where it failed to
      perform more in depth forensics it is a bit hard to determine the
      exact cause.  I performed some local testing using the Fedora 28
      and could not replicate the exact circumstance unless I deleted a
      file in the sysroot.  From what I can tell there are two ways of
      seeing the problem.  <br>
    </p>
    <p>1) Host contamination <br>
    </p>
    <p>% pkg-config sqlite3 --libs --static<br>
      -lsqlite3 -lm -ldl -lz -lpthread <br>
    </p>
    <p>This was not the way the sqlite3 was built.  However there is no
      way to know if this was the circumstance without poking around in
      the log files and re-running the context of the run.do_compile
      script in the packages temp directory.</p>
    <p>2) Dependency race<br>
    </p>
    <p>This is the one where I deleted a file to simulate the problem,
      but I couldn't reproduce it.  For this, we'd really need to look
      at the failed machine's log of the build of sqlite3, which may be
      long gone from the sstate.  But it should have the pkg-config
      files laying around.  If it shows that it did build against the
      zlib, but zlib was not listed dependency it was never going to
      build because the recipe-sysroot-native is not going to have the
      required library. <br>
    </p>
    <p>There of course might be other ways to end up with the same
      result but these are the most likely candidates, each of which is
      fixed by listing the dependency.   I too would like to know the
      actual root cause, but without access to the build it is hard to
      track it down.<br>
    </p>
    <p>Cheers,<br>
    </p>
    <p>Jason<br>
    </p>
  </body>
</html>

--------------7583488E304B0A0F5A6A0AF9--
