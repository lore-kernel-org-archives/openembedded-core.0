Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B6C8CD3423
	for <webhook@archiver.kernel.org>; Fri,  1 May 2026 22:07:58 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17964.1777651834916690564
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 May 2026 09:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=kH4661U/;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: ernestvanhoecke@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483487335c2so22751415e9.2
        for <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 09:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777651833; x=1778256633; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WwPZRKe0nNCyS0KyyYObM7fj+h9rTDrwlEOoR4TqexQ=;
        b=kH4661U/9pk4r8IJ88HNSxBJe/P79Sdh1KzEEtP6a0sVG5PNHlA6oqw6n6JhdtPXYh
         RTTwTJLXLTEB35lwqArUD/AuwB9Rwy6gXgGw4CEp9jn2Aoc6PLkhfD1Jn6lDD5ZXuYYY
         zKQQu6itrcGER5hyMPDFSw9eeMhcAZ4izlXZFaXowVmEvWAXzc/p6+yYRhb0pGX4dtO5
         Xt/avrVaAxodxehCm4eAQIdEKwuKpC/L+kffZrRO0vpFNpygLpdRJoGW07dZGzqoKu8c
         AtgWCWuKNJKn+SobH58izYgLtjK5Q546nWIKkDuHZgFwCV/peEysVcM0xvw5KVM3WpYF
         kTNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777651833; x=1778256633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WwPZRKe0nNCyS0KyyYObM7fj+h9rTDrwlEOoR4TqexQ=;
        b=GjZLC6Cu73F5BbaCKhXh41GYZZekLV4r3udDCiv4GCnid0LPoqj6+qDqVW4NCMlVQO
         UXyTNOmSYx5GNfuPVPPd/WAqv3aXUmynmM3o/S0zDuEK0VeMKEG/tDUxF0a1QetLDxZ1
         q+PZiabfHg6GBOn5O61DUEzR8N2GjxWB0iTOSonyz2ZavCcmjc58TZnrxE2Glp/gPeBC
         K5y7TeEoBTLkELmNYEiKwPhQbJiLGphQl+xdjYKK8GbInLYT+DmTXLik2/sMWBRRJCBX
         TPQDCgX5vr5kwQy3KGkruSALfY2Aej+rnHQS3hxhf/c1x3wfMcbpnU3lnCo1FjWoR/Md
         Wg8w==
X-Forwarded-Encrypted: i=1; AFNElJ8R0jIWUOjdjUZ9ALHvK/t8f3bJRikFesIvc69v+/62gG2DvEs71c+rnkmZzjbn07Oa6Frx/jc2Yx291h+fdCTrmg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzB5ZdhdZzO9wau/Y1Ax/AaFey7q48+Et34Sy3rgZ9TfR7hM04U
	9N6ePago4ytlt6K4L1vUbpmxDu0vD3+XoGsdrgDoFhai7qzQPoaO2haZ
X-Gm-Gg: AeBDies3SC17/3RSI/dOuMCZop2C3OdxBdV4Cfe1PGlziEqXW0fbu2mTESq0gbUaCFH
	VvYCNI17I4orvXycEaUZSp1H2YNTPTI5lvveZ3p3juW5JbmHZ3PENUV9MwKR437egWTqX1SspoS
	iFXNUo6BboGMm+QGvDpkcW08+lsl/gqR40GG57jZnYbfvGVRn4EhvPi8G5tza6oneDouwx1Ul3U
	lAulpQ3J21+4rAHbOqV+9zGnQzbgIP/SQLgmBmYL/VfHwimQwJYcE/d77MPX/5qNS04IBvDqTD0
	HgLFFJVwiMQL72ge1lwZIeiFclRZxodFkpf0dgDGVLjGzukWKDyX/FaUMzZpR9+9liX8VdH5DJ4
	Kkbn15QbIhISviSQLsw7XXT8j/PI51tlgM+MT78G+7AjRz1OvzXjkyq8nmU0rRKFTiTBL6XJesT
	D2NEzYOsqIT4orThIt4JyDIgKwFKKixFLJ+hFC3US1aQKjG7Iwk9utp32zRdAGmG3JA+o/8JoRZ
	YtDo9ySwPxaqHLrBlB9rdyJKUvbO0qdhNDBX95mE8N93uo=
X-Received: by 2002:a05:600c:8904:b0:48a:592c:e63d with SMTP id 5b1f17b1804b1-48a8451d001mr92448035e9.14.1777651832738;
        Fri, 01 May 2026 09:10:32 -0700 (PDT)
Received: from ernest.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb3427fsm109092155e9.0.2026.05.01.09.10.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 09:10:32 -0700 (PDT)
From: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Peter Marko <peter.marko@siemens.com>,
	Zeming LIU <zeming.liu@windriver.com>,
	openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH] jsoncpp: Fix C++11 ABI breakage when compiled with C++17
Date: Fri,  1 May 2026 18:08:59 +0200
Message-ID: <20260501160902.1164934-1-ernestvanhoecke@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 May 2026 22:07:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236304

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

When jsoncpp is built with C++17, 1.9.7 drops several legacy overloads
that C++11 consumers can still link against.

Backport the upstream fix to restore compatibility.

Fixes errors such as:
|  undefined reference to `Json::Value::operator[](char const*)'

Patch can be dropped when we move to 1.9.8.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 ...akage-when-compiled-with-C-17-1668-1.patch | 368 ++++++++++++++++++
 .../recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb |   1 +
 2 files changed, 369 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch

diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
new file mode 100644
index 000000000000..887bf14d2af5
--- /dev/null
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp/0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch
@@ -0,0 +1,368 @@
+From c67034e4b4c722579ee15fddb8e4af8f04252b08 Mon Sep 17 00:00:00 2001
+From: Jordan Bayles <bayles.jordan@gmail.com>
+Date: Thu, 9 Apr 2026 10:37:08 -0700
+Subject: [PATCH] Fix C++11 ABI breakage when compiled with C++17 #1668 (#1675)
+
+When JSONCPP_HAS_STRING_VIEW was defined, the library dropped the
+`const char*` and `const String&` overloads for `operator[]`, `get`,
+`removeMember`, and `isMember`, breaking ABI compatibility for projects
+consuming the library with C++11.
+
+This change unconditionally declares and defines the legacy overloads
+so they are always exported, restoring compatibility.
+
+This commit completely eliminates the ABI breakage that occurs across
+C++ standard boundaries when using `std::string_view`.
+
+Previously, when the library was built with C++17+, CMake would leak
+`JSONCPP_HAS_STRING_VIEW=1` as a PUBLIC definition. A C++11 consumer
+would receive this definition, attempt to parse the header, and fail
+with compiler errors because `std::string_view` is not available in
+their environment.
+
+Conversely, if the library was built in C++11 (without `string_view`
+symbols), a C++17 consumer would naturally define
+`JSONCPP_HAS_STRING_VIEW` based on `__cplusplus` inside `value.h`. The
+consumer would then call the declared `string_view` methods, resulting
+in linker errors because the methods weren't compiled into the library.
+
+By moving all `std::string_view` overloads directly into `value.h` as
+`inline` methods that delegate to the fundamental
+`const char*, const char*` methods:
+1. The consumer's compiler dictates whether the overloads are visible
+   (via `__cplusplus >= 201703L`).
+2. The consumer compiles the inline wrappers locally, removing any
+   reliance on the library's exported symbols for `std::string_view`.
+3. CMake no longer needs to pollute the consumer's environment with
+   PUBLIC compile definitions.
+
+Backported only the library/header changes. Upstream CI and example
+test additions are omitted.
+
+Upstream-Status: Backport [https://github.com/open-source-parsers/jsoncpp/commit/c67034e4b4c722579ee15fddb8e4af8f04252b08]
+Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
+---
+ include/json/value.h        | 54 ++++++++++++++++++++----------
+ src/lib_json/CMakeLists.txt |  9 -----
+ src/lib_json/json_value.cpp | 66 -------------------------------------
+ 3 files changed, 36 insertions(+), 93 deletions(-)
+
+diff --git a/include/json/value.h b/include/json/value.h
+index f32f45609365..2007e6b4251d 100644
+--- a/include/json/value.h
++++ b/include/json/value.h
+@@ -357,7 +357,8 @@ public:
+   Value(const StaticString& value);
+   Value(const String& value);
+ #ifdef JSONCPP_HAS_STRING_VIEW
+-  Value(std::string_view value);
++  inline Value(std::string_view value)
++      : Value(value.data(), value.data() + value.length()) {}
+ #endif
+   Value(bool value);
+   Value(std::nullptr_t ptr) = delete;
+@@ -405,7 +406,14 @@ public:
+   /** Get string_view of string-value.
+    *  \return false if !string. (Seg-fault if str is NULL.)
+    */
+-  bool getString(std::string_view* str) const;
++  inline bool getString(std::string_view* str) const {
++    char const* begin;
++    char const* end;
++    if (!getString(&begin, &end))
++      return false;
++    *str = std::string_view(begin, static_cast<size_t>(end - begin));
++    return true;
++  }
+ #endif
+   Int asInt() const;
+   UInt asUInt() const;
+@@ -496,12 +504,19 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Access an object value by name, create a null member if it does not exist.
+   /// \param key may contain embedded nulls.
+-  Value& operator[](std::string_view key);
++  inline Value& operator[](std::string_view key) {
++    return resolveReference(key.data(), key.data() + key.length());
++  }
+   /// Access an object value by name, returns null if there is no member with
+   /// that name.
+   /// \param key may contain embedded nulls.
+-  const Value& operator[](std::string_view key) const;
+-#else
++  inline const Value& operator[](std::string_view key) const {
++    Value const* found = find(key.data(), key.data() + key.length());
++    if (!found)
++      return nullSingleton();
++    return *found;
++  }
++#endif
+   /// Access an object value by name, create a null member if it does not exist.
+   /// \note Because of our implementation, keys are limited to 2^30 -1 chars.
+   /// Exceeding that will cause an exception.
+@@ -516,7 +531,6 @@ public:
+   /// that name.
+   /// \param key may contain embedded nulls.
+   const Value& operator[](const String& key) const;
+-#endif
+   /** \brief Access an object value by name, create a null member if it does not
+    * exist.
+    *
+@@ -533,8 +547,10 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+-  Value get(std::string_view key, const Value& defaultValue) const;
+-#else
++  inline Value get(std::string_view key, const Value& defaultValue) const {
++    return get(key.data(), key.data() + key.length(), defaultValue);
++  }
++#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   Value get(const char* key, const Value& defaultValue) const;
+@@ -542,7 +558,6 @@ public:
+   /// \note deep copy
+   /// \param key may contain embedded nulls.
+   Value get(const String& key, const Value& defaultValue) const;
+-#endif
+   /// Return the member named key if it exist, defaultValue otherwise.
+   /// \note deep copy
+   /// \note key may contain embedded nulls.
+@@ -588,13 +603,14 @@ public:
+   /// \pre type() is objectValue or nullValue
+   /// \post type() is unchanged
+ #if JSONCPP_HAS_STRING_VIEW
+-  void removeMember(std::string_view key);
+-#else
++  inline void removeMember(std::string_view key) {
++    removeMember(key.data(), key.data() + key.length(), nullptr);
++  }
++#endif
+   void removeMember(const char* key);
+   /// Same as removeMember(const char*)
+   /// \param key may contain embedded nulls.
+   void removeMember(const String& key);
+-#endif
+   /** \brief Remove the named map member.
+    *
+    *  Update 'removed' iff removed.
+@@ -602,13 +618,14 @@ public:
+    *  \return true iff removed (no exceptions)
+    */
+ #if JSONCPP_HAS_STRING_VIEW
+-  bool removeMember(std::string_view key, Value* removed);
+-#else
++  inline bool removeMember(std::string_view key, Value* removed) {
++    return removeMember(key.data(), key.data() + key.length(), removed);
++  }
++#endif
+   bool removeMember(String const& key, Value* removed);
+   /// Same as removeMember(const char* begin, const char* end, Value* removed),
+   /// but 'key' is null-terminated.
+   bool removeMember(const char* key, Value* removed);
+-#endif
+   /// Same as removeMember(String const& key, Value* removed)
+   bool removeMember(const char* begin, const char* end, Value* removed);
+   /** \brief Remove the indexed array element.
+@@ -622,15 +639,16 @@ public:
+ #ifdef JSONCPP_HAS_STRING_VIEW
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+-  bool isMember(std::string_view key) const;
+-#else
++  inline bool isMember(std::string_view key) const {
++    return isMember(key.data(), key.data() + key.length());
++  }
++#endif
+   /// Return true if the object has a member named key.
+   /// \note 'key' must be null-terminated.
+   bool isMember(const char* key) const;
+   /// Return true if the object has a member named key.
+   /// \param key may contain embedded nulls.
+   bool isMember(const String& key) const;
+-#endif
+   /// Same as isMember(String const& key)const
+   bool isMember(const char* begin, const char* end) const;
+
+diff --git a/src/lib_json/CMakeLists.txt b/src/lib_json/CMakeLists.txt
+index 03e9335525ca..a0695e9eba83 100644
+--- a/src/lib_json/CMakeLists.txt
++++ b/src/lib_json/CMakeLists.txt
+@@ -131,9 +131,6 @@ if(BUILD_SHARED_LIBS)
+
+     target_compile_features(${SHARED_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${SHARED_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${SHARED_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+@@ -168,9 +165,6 @@ if(BUILD_STATIC_LIBS)
+
+     target_compile_features(${STATIC_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${STATIC_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${STATIC_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+@@ -198,9 +192,6 @@ if(BUILD_OBJECT_LIBS)
+
+     target_compile_features(${OBJECT_LIB} PUBLIC ${REQUIRED_FEATURES})
+
+-    if(JSONCPP_HAS_STRING_VIEW)
+-        target_compile_definitions(${OBJECT_LIB} PUBLIC JSONCPP_HAS_STRING_VIEW=1)
+-    endif()
+
+     target_include_directories(${OBJECT_LIB} PUBLIC
+         $<INSTALL_INTERFACE:${CMAKE_INSTALL_INCLUDEDIR}>
+diff --git a/src/lib_json/json_value.cpp b/src/lib_json/json_value.cpp
+index 74f77896fa7b..a8eb72d6b75f 100644
+--- a/src/lib_json/json_value.cpp
++++ b/src/lib_json/json_value.cpp
+@@ -441,14 +441,6 @@ Value::Value(const String& value) {
+       value.data(), static_cast<unsigned>(value.length()));
+ }
+
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-Value::Value(std::string_view value) {
+-  initBasic(stringValue, true);
+-  value_.string_ = duplicateAndPrefixStringValue(
+-      value.data(), static_cast<unsigned>(value.length()));
+-}
+-#endif
+-
+ Value::Value(const StaticString& value) {
+   initBasic(stringValue);
+   value_.string_ = const_cast<char*>(value.c_str());
+@@ -656,21 +648,6 @@ bool Value::getString(char const** begin, char const** end) const {
+   return true;
+ }
+
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::getString(std::string_view* str) const {
+-  if (type() != stringValue)
+-    return false;
+-  if (value_.string_ == nullptr)
+-    return false;
+-  const char* begin;
+-  unsigned length;
+-  decodePrefixedString(this->isAllocated(), this->value_.string_, &length,
+-                       &begin);
+-  *str = std::string_view(begin, length);
+-  return true;
+-}
+-#endif
+-
+ String Value::asString() const {
+   switch (type()) {
+   case nullValue:
+@@ -1190,17 +1167,6 @@ Value* Value::demand(char const* begin, char const* end) {
+                       "objectValue or nullValue");
+   return &resolveReference(begin, end);
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-const Value& Value::operator[](std::string_view key) const {
+-  Value const* found = find(key.data(), key.data() + key.length());
+-  if (!found)
+-    return nullSingleton();
+-  return *found;
+-}
+-Value& Value::operator[](std::string_view key) {
+-  return resolveReference(key.data(), key.data() + key.length());
+-}
+-#else
+ const Value& Value::operator[](const char* key) const {
+   Value const* found = find(key, key + strlen(key));
+   if (!found)
+@@ -1221,7 +1187,6 @@ Value& Value::operator[](const char* key) {
+ Value& Value::operator[](const String& key) {
+   return resolveReference(key.data(), key.data() + key.length());
+ }
+-#endif
+
+ Value& Value::operator[](const StaticString& key) {
+   return resolveReference(key.c_str());
+@@ -1261,18 +1226,12 @@ Value Value::get(char const* begin, char const* end,
+   Value const* found = find(begin, end);
+   return !found ? defaultValue : *found;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-Value Value::get(std::string_view key, const Value& defaultValue) const {
+-  return get(key.data(), key.data() + key.length(), defaultValue);
+-}
+-#else
+ Value Value::get(char const* key, Value const& defaultValue) const {
+   return get(key, key + strlen(key), defaultValue);
+ }
+ Value Value::get(String const& key, Value const& defaultValue) const {
+   return get(key.data(), key.data() + key.length(), defaultValue);
+ }
+-#endif
+
+ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+   if (type() != objectValue) {
+@@ -1288,31 +1247,13 @@ bool Value::removeMember(const char* begin, const char* end, Value* removed) {
+   value_.map_->erase(it);
+   return true;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::removeMember(std::string_view key, Value* removed) {
+-  return removeMember(key.data(), key.data() + key.length(), removed);
+-}
+-#else
+ bool Value::removeMember(const char* key, Value* removed) {
+   return removeMember(key, key + strlen(key), removed);
+ }
+ bool Value::removeMember(String const& key, Value* removed) {
+   return removeMember(key.data(), key.data() + key.length(), removed);
+ }
+-#endif
+-
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-void Value::removeMember(std::string_view key) {
+-  JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
+-                      "in Json::Value::removeMember(): requires objectValue");
+-  if (type() == nullValue)
+-    return;
+
+-  CZString actualKey(key.data(), unsigned(key.length()),
+-                     CZString::noDuplication);
+-  value_.map_->erase(actualKey);
+-}
+-#else
+ void Value::removeMember(const char* key) {
+   JSON_ASSERT_MESSAGE(type() == nullValue || type() == objectValue,
+                       "in Json::Value::removeMember(): requires objectValue");
+@@ -1323,7 +1264,6 @@ void Value::removeMember(const char* key) {
+   value_.map_->erase(actualKey);
+ }
+ void Value::removeMember(const String& key) { removeMember(key.c_str()); }
+-#endif
+
+ bool Value::removeIndex(ArrayIndex index, Value* removed) {
+   if (type() != arrayValue) {
+@@ -1353,18 +1293,12 @@ bool Value::isMember(char const* begin, char const* end) const {
+   Value const* value = find(begin, end);
+   return nullptr != value;
+ }
+-#ifdef JSONCPP_HAS_STRING_VIEW
+-bool Value::isMember(std::string_view key) const {
+-  return isMember(key.data(), key.data() + key.length());
+-}
+-#else
+ bool Value::isMember(char const* key) const {
+   return isMember(key, key + strlen(key));
+ }
+ bool Value::isMember(String const& key) const {
+   return isMember(key.data(), key.data() + key.length());
+ }
+-#endif
+
+ Value::Members Value::getMemberNames() const {
+   JSON_ASSERT_MESSAGE(
+--
+2.43.0
diff --git a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
index 797f093f3349..354f4e91156a 100644
--- a/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
+++ b/meta-oe/recipes-devtools/jsoncpp/jsoncpp_1.9.7.bb
@@ -15,6 +15,7 @@ PE = "1"
 
 SRCREV = "3455302847cf1e4671f1d8f5fa953fd46a7b1404"
 SRC_URI = "git://github.com/open-source-parsers/jsoncpp;branch=master;protocol=https;tag=${PV} \
+           file://0001-Fix-C-11-ABI-breakage-when-compiled-with-C-17-1668-1.patch \
            file://run-ptest \
            "
 
-- 
2.43.0


