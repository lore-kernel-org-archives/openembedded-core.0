Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.32820.1605036400263193493
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Nov 2020 11:26:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cbVRTWva;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id 11so12630127qkd.5
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2020 11:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6+IwfitFKXhob+46t0FY6/1Dji4Dj2UY0Lre6uArb/8=;
        b=cbVRTWvab6AWE9RYcrvoJ03V7bEBTX+PZ9E1cNxb1yM4Cd5bh5vkdApHqMs6/l4eFF
         nBZqMVIJnIrAtF8I/ZD25XAyvZyi4eK1VuTZWqkoWkOim/mt7k9RN8vsXNwuzFZn1Kp0
         3+3JoFGioOKrIu6W9KwOSG2HERWlyLwOcxAXbT+qsr+WcJYnzm2NgFEClbxDSgLWh0aC
         6VNoGyitb3V667T0kaUv14paeOTZZSQGdklLgrWo3iGMgCri6qxfRRH3hO/98S2X3OYA
         eT8pEyE8FsKzDTbUdOOp3hNoxJfgJRoR2n8pBGm/pgeiME2I4nwJbg7vnT+7x7mJopoe
         NRgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6+IwfitFKXhob+46t0FY6/1Dji4Dj2UY0Lre6uArb/8=;
        b=Lv/XBVg2Roza6uKa3ypQ/5PJg+V6EbTDTEtVDGZ+C95N+PMfhDT5ivPS9MqGzq7TK7
         nBsSwCcm34MSaIJWSc/sa3rHKWnRbaRwioJiAToRr5Z3JNAQPep8zZIepTKnSbRdgQId
         e2mJ1mmDVJf9rlvpDceXIDr7W0KzIrFjBlLN5yEVrZLpnsczaC2/Nng/q9F7MqLvGAWL
         UuJQJZoB2pX77+5U59jEQIL70Jdyr0jLDnifqnxFfycr22Mj/gRORGvi0ypyWg9eRFYM
         8k2gVH9LfLVjvJxBthbzgXxczJsFDrq6Qu1GQcv1WyrQpVCFJItTKyFNnuH5k7CyaDwj
         GvGA==
X-Gm-Message-State: AOAM532yIZvtEpGBhjFwaqzs00QzaRJt+zTMLFc+wAE1opAdXB0putEE
	dNeEPjEM/mNOLVjtREJCcgEyOxLjk8lJtlCQi2s=
X-Google-Smtp-Source: ABdhPJzdhdZ1QeIw42giGRtw83FrzKbyPrU95hghF7OKe6d+9bzbnr4GSwyVpnDDSu9oVgRKdwIHhZ0FU6mOuTLOhFs=
X-Received: by 2002:a37:6195:: with SMTP id v143mr19810702qkb.71.1605036399219;
 Tue, 10 Nov 2020 11:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20201107020156.351764-1-alhe@linux.microsoft.com>
In-Reply-To: <20201107020156.351764-1-alhe@linux.microsoft.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 10 Nov 2020 11:26:13 -0800
Message-ID: <CAMKF1spGkOh9nXmDXxTihdV_JGM7qvqQkdYF6JnP=5wd2mTd3Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3: Update manifest
To: Alejandro Hernandez Samaniego <alejandro@enedino.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

This has some consequences for recipes which depend on python3-typing
see parse logs

http://jenkins.nas-admin.org/view/OE/job/oe_world_qemux86-64/1962/consoleFull

On Fri, Nov 6, 2020 at 6:02 PM Alejandro Hernandez Samaniego
<alejandro@enedino.org> wrote:
>
> Update the python3-manifest to match the files installed by the
> new version of python3.
> - Kept tkinter the way it was although tk isnt part of OE-Core
> - Made typing part of python3-core
> - Update other packages with new dependencies such as filecmp and dataclasses.
>
> Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
> ---
>  .../python/python3/python3-manifest.json      | 35 +++++--------------
>  1 file changed, 9 insertions(+), 26 deletions(-)
>
> diff --git a/meta/recipes-devtools/python/python3/python3-manifest.json b/meta/recipes-devtools/python/python3/python3-manifest.json
> index 69aecb7004..615dc3a5e5 100644
> --- a/meta/recipes-devtools/python/python3/python3-manifest.json
> +++ b/meta/recipes-devtools/python/python3/python3-manifest.json
> @@ -122,8 +122,7 @@
>              "logging",
>              "netclient",
>              "numbers",
> -            "stringold",
> -            "typing"
> +            "stringold"
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/asyncio",
> @@ -173,10 +172,12 @@
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/compileall.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/filecmp.py",
>              "${libdir}/python${PYTHON_MAJMIN}/py_compile.py"
>          ],
>          "cached": [
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/compileall.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/filecmp.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/py_compile.*.pyc"
>          ]
>      },
> @@ -313,6 +314,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/tokenize.py",
>              "${libdir}/python${PYTHON_MAJMIN}/traceback.py",
>              "${libdir}/python${PYTHON_MAJMIN}/types.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/typing.py",
>              "${libdir}/python${PYTHON_MAJMIN}/urllib",
>              "${libdir}/python${PYTHON_MAJMIN}/urllib/parse.py",
>              "${libdir}/python${PYTHON_MAJMIN}/warnings.py",
> @@ -388,6 +390,7 @@
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/tokenize.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/types.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/warnings.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/weakref.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/collections/__pycache__",
> @@ -557,18 +560,12 @@
>      "doctest": {
>          "summary": "Python framework for running examples in docstrings",
>          "rdepends": [
> -            "asyncio",
>              "core",
>              "debugger",
>              "difflib",
> -            "io",
> -            "logging",
> -            "netclient",
> -            "numbers",
>              "pprint",
>              "shell",
>              "stringold",
> -            "typing",
>              "unittest"
>          ],
>          "files": [
> @@ -822,7 +819,6 @@
>              "terminal",
>              "threading",
>              "tkinter",
> -            "typing",
>              "unittest",
>              "unixadmin",
>              "venv",
> @@ -999,12 +995,14 @@
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/cProfile.py",
> +            "${libdir}/python${PYTHON_MAJMIN}/dataclasses.py",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_lsprof.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/profile.py",
>              "${libdir}/python${PYTHON_MAJMIN}/pstats.py"
>          ],
>          "cached": [
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/cProfile.*.pyc",
> +            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/dataclasses.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/profile.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/pstats.*.pyc"
>          ]
> @@ -1130,13 +1128,11 @@
>              "core"
>          ],
>          "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/_dummy_thread.py",
>              "${libdir}/python${PYTHON_MAJMIN}/_threading_local.py",
>              "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_queue.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/queue.py"
>          ],
>          "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_dummy_thread.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/_threading_local.*.pyc",
>              "${libdir}/python${PYTHON_MAJMIN}/__pycache__/queue.*.pyc"
>          ]
> @@ -1147,23 +1143,11 @@
>              "core"
>          ],
>          "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
> +           "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so",
>              "${libdir}/python${PYTHON_MAJMIN}/tkinter"
>          ],
>          "cached": []
>      },
> -    "typing": {
> -        "summary": "Python typing support",
> -        "rdepends": [
> -            "core"
> -        ],
> -        "files": [
> -            "${libdir}/python${PYTHON_MAJMIN}/typing.py"
> -        ],
> -        "cached": [
> -            "${libdir}/python${PYTHON_MAJMIN}/__pycache__/typing.*.pyc"
> -        ]
> -    },
>      "unittest": {
>          "summary": "Python unit testing framework",
>          "rdepends": [
> @@ -1175,8 +1159,7 @@
>              "netclient",
>              "numbers",
>              "pprint",
> -            "stringold",
> -            "typing"
> +            "stringold"
>          ],
>          "files": [
>              "${libdir}/python${PYTHON_MAJMIN}/unittest",
> --
> 2.25.1
>
>
> 
>
